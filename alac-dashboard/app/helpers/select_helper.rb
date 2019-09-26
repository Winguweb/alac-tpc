module SelectHelper
  def penal_stage_options
    stage_select = ['Noticia criminal',
   ' Conciliación',
    'Indagación preliminar',
    'Orden de captura',
    'Audiencia de legalización de captura',
    'Audiencia de formulación de imputación',
    'Audiencia de solicitud e imposición de medida de aseguramiento',
    'Investigación',
    'Audiencia de formulación de acusación', 
    'Audiencia preparatoria',
    'Audiencia de juicio oral', 
    'Audiencia de sentencia absolutoria',
    'Audiencia de sentencia condenatoria',
    'Audiencia de incidente de reparación integral',
    'Audiencia de preclusión (archivo de las diligencias)',
    'Audiencia de allanamiento a cargos (aceptación de los cargos imputados)',
    'Audiencia de preacuerdo',
    'Principio de oportunidad',
    'Apelación de la Fiscalía',
    'Apelación de la defensa',
    'Apelación del ministerio público',
    'Fallo de segunda instancia',
    'No Aplica',
    'No Disponible',
    'Otra']
  end

  def fiscal_stage_options
    stage_select = ['Denuncia',
    'Informe de auditoría',
    'Indagación preliminar',
    'Auto de apertura del proceso de responsabilidad fiscal',
    'Decreto de medidas cautelares',
    'Solicitud del desembargo al órgano fiscalizador',
    'Auto que ordena la apertura del proceso de responsabilidad fiscal', 
    'Vinculación del garante (tercero civilmente responsable)',
    'Auto de imputación',
    'Notificación del auto de imputación de responsabilidad fiscal',
    'Traslado a los presuntos responsables fiscales del auto de imputación', 
    'Decreto de pruebas',
    'Denegación de pruebas solicitadas o allegadas',
    'Fallo de primera instancia con responsabilidad fiscal',
    'Inclusión en el boletín de responsables fiscales',
    'Fallo de primera instancia sin  responsabilidad fiscal',
    'Notificación del fallo',
    'Fallo de segunda instancia',
    'Consulta',
    'Archivo del proceso',
    'No Aplica',
    'No Disponible',
    'Otra']
  end

  def disciplinary_stage_options
    stage_select = [
      'Queja disciplinaria',
      'Informe',
      'Solicitud de oficio',
      'Suspensión provisional',
      'Evaluación de la noticia disciplinaria',
      'Indagación preliminar',
      'Evaluación de la indagación preliminar',
      'Apertura de la investigación',
      'Evaluación de la investigación',
      'Apertura de pliego de cargos',
      'Traslado para descargos',
      'Decreto de pruebas',
      'Traslado para alegatos',
      'Fallo de primera instancia',
      'Fallo de segunda instancia',
      'Auto de cierre de la investigación',
      'No Aplica',
      'No Disponible',
      'Otros',
    ]
  end

  def penal_situation_options
    situation_select = ['Indiciado',
    'Capturado',
    'Imputado',
    'Con medida de aseguramiento',
    'Sin medida de aseguramiento',
    'Investigado',
    'Acusado',
    'Absuelto',
    'Condenado', 
    'Privado de la libertad en establecimiento carcelario',
    'Inhabilitado para el ejercicio de derechos y funciones públicas',
    'Suspensión condicional de la ejecución de la pena',
    'Prisión domiciliaria',
    'Con libertad condicional',
    'No aplica',
    'No disponible',
    'Otros']
  end

  def fiscal_situation_options
    situation_select = ['Indiciado',
    'Imputado',
    'Responsable fiscalmente',
    'Absuelto',
    'No aplica',
    'No disponible',
    'Otros']
  end

  def disciplinary_situation_options
    situation_selec = ['Investigado',
    'Disciplinado',
    'Suspendido',
    'Reintegrado',
    'Sancionado',
    'No aplica',
    'No disponible',
    'Otros']
  end
end