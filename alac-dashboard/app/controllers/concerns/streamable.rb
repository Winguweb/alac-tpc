
module Streamable
  include ActiveSupport::Concern

  def stream_xlsx()
    buffer = StringIO.new
    xlsx = Xlsxtream::Workbook.new(buffer)

    xlsx.write_worksheet 'Caracterización' do |sheet|
      sheet << get_char_headers
      #reports obtiene todos los id de GB BD
      reports = get_index_reports()
      
      reports.each do | report|
        if characterization = Characterization.where(case_id: report[0]).first
          elements = get_report_detail(report[0])
          hecho =  elements[0][1]
          haseahble = []
          elements.each do |answer|
            haseahble.push(answer[0])
            haseahble.push(answer[1])
          end
          
          char_data =  Hash[*haseahble]
          final_keys = char_data.keys - ["Edad/Género","Edad","Genero","¿Cuál es el presunto hecho de corrupción que  quiere reportar?","Departamento del Hecho","¿Con el fin de formalizar su denuncia, estaría dispuesto (a) a acudir ante la autoridad competente para denunciar el hecho de presunta corrupción para el cual está solicitando nuestra asesoría?","¿Ha denunciado ante alguna autoridad o algún medio de comunicación el hecho que está reportando?","Adjuntar Evidencias","Nombre(s)","Apellido(s)","Correo Electrónico","Teléfono de Contacto","Nivel de escolaridad","Ocupación","Tipo de Persona","Departamento de Residencia","¿Es usted lider social o defensor de derechos humanos?","Terminos","¿Por qué?","¿Cual?","¿A cuál organización pertenece?"] 
          sheet << [
            report[0],
            get_info_report(report[0])[0][1],
            characterization.status,
            hecho,
            characterization.scope,
            format_arr(characterization.affected_sector),
            format_arr(characterization.rights_violated),
            format_arr(characterization.kind_corruption),
            format_arr(characterization.affected_area),
            format_arr(characterization.kind_responsability),
            format_arr(characterization.crime),
            char_data["Departamento del Hecho"],
            char_data[final_keys[1]],
            char_data["Departamento de Residencia"],
            char_data[final_keys[2]],
            char_data["Edad"],
            char_data["Ocupación"],
            char_data["¿Es usted lider social o defensor de derechos humanos?"],
            char_data["¿A cuál organización pertenece?"],
            char_data["¿Cual?"],
            char_data["¿Con el fin de formalizar su denuncia, estaría dispuesto (a) a acudir ante la autoridad competente para denunciar el hecho de presunta corrupción para el cual está solicitando nuestra asesoría?"],
            char_data["¿Por qué?"],
            char_data[final_keys[0]],
            characterization.start_year,
            characterization.end_year
          ]
        end
      end

      # Characterization.all.each do |characterization|
      #   sheet << [characterization.scope,characterization.affected_sector,characterization.rights_violated,characterization.kind_corruption,characterization.affected_area,characterization.kind_responsability]
      # end    
    end

     
    xlsx.write_worksheet 'Actores' do |sheet|
      sheet.add_row ['ID del caso', 'Tipo de Participacion',"Actor","Tipo de participación","Tipo de actor ","Subcategoría 1 actor","Subcategoría 2 actor","Institución","Tipo Institución","Cargo","Rama del poder Público","Partido Político"]
      Actor.all.each do | actor |
        
        if actor.relationships
          actor.relationships.each do |relation|
            sheet.add_row [relation.characterization.case_id, relation.participation_type,"#{actor.name} #{actor.last_name}",actor.general_type,actor.category,actor.subtype,actor.subtype_2,actor.institution,actor.category,actor.position,actor.public_branch,actor.entity]     
          end
        else
          sheet.add_row ["-","-",actor.last_name,actor.general_type,actor.category,actor.subtype,actor.subtype_2,actor.institution,actor.category,actor.position,actor.public_branch,actor.entity]     
        end
        # sheet.add_row [Time.now, 'Time-machine']
      end
      
    end

    xlsx.write_worksheet 'Proceso Judicial' do |sheet|
      sheet << ["ID del Caso","Etapa Procesal","Entidad de Conocimiento","Fecha de presentación de la denuncia","Observacione sobre el caso"]
      Evolution.all.each do |evolution|
        sheet << [evolution.characterization.case_id,evolution.stage,evolution.authority,evolution.presentation_date,evolution.comment]
      end
    end

    xlsx.write_worksheet 'Asesoría Legal' do |sheet|
      sheet << ["ID del Caso","ID de la Asesoría","Fecha de Seguimiento ALAC","Tipo de respuesta que se dio al reportante","Cuadro resumen de la actuación"]
      Advisory.all.each do |advisory|
        sheet << [advisory.characterization.case_id,advisory.id, advisory.tracking_date,format_arr(advisory.kind_answer),advisory.summary]
      end
    end

    xlsx.write_worksheet 'Herramientas' do |sheet|
      sheet << ["ID de la Asesoría",  "Herramientas legales utilizadas por ALAC","Se radicó ante la entidad o aurotidad a quien iba digirida?","La autoridad o entidad a quien iba diriga dio respuesta?"]
      Tool.all.each do |tool|
        sheet << [tool.advisory.id,tool.tools_used,tool.go_entity,tool.have_answer]
      end
    end
   
    xlsx.close

    buffer.rewind

    set_xlsx_file_headers("Reportes")
    set_streaming_headers
    # send_data buffer.read, filename: "#{exporter.filename}.xlsx", type: "application/vnd.ms-excel"
    self.response_body = buffer.read
  end

  private

  def set_xlsx_file_headers(filename)
    file_name = "#{filename}.xlsx"
    headers['Content-Type'] = 'application/vnd.ms-excel; charset=utf-8; header=present'
    headers['Content-Disposition'] = "attachment; filename=\"#{file_name}\""
  end

  def set_streaming_headers
    headers['Cache-Control'] = 'no-cache'
    headers['X-Accel-Buffering'] = 'no'
    headers.delete('Content-Length')
  end

  def get_char_headers
    return ["id caso", 
      "Fecha de ingreso del Reporte al ALAC", 
      "Estado del Caso", 
      "Hechos", 
      
      "Nacional/Transnacional",
      "Sector Afectado",
      "Derecho presuntamente  Vulnerado",
      "Tipo Corrupción",
      "Ámbito de la gestión pública Afectado",
      "Clase de presunta responsabilidad", 
      "Presunto Delito",
      "Departamento de los hechos", 
      "Municipio de los hechos",
      "Departamento de Ubicación del reportante", 
      "Municipio de ubicación del reportante", 
      "Rango de Edad de reportante",
      "Ocupación del Reportante", 
      "Reportante es lider social o defensor de derecho humanos?",
      "¿A cuál organización pertence el reportante?", 
      "¿Ha presentado este caso ante alguna autoridad?", 
      "¿Está usted dispuesto a presentar esta denuncia ante las autoridades públicas competentes?",
      "Motivos por no estar dispuesto a denunciar",
      "¿Pertenece a alguna de las siguiente poblaciones?",
      "Año inicial del hecho",
      "Año final del hecho"]
  end

  def format_arr(string)
    unless string.nil? || string =='' || string == 'null'
      parsed_json = JSON.parse(string)
      return parsed_json.join(', ').html_safe
    end
  end
end
