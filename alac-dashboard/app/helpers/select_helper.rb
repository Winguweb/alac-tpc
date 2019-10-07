module SelectHelper

  def get_options
    {
      'penal_stage_options' => [
        'Noticia criminal',
        'Conciliación',
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
        'Otra'
      ],
      'fiscal_stage_options' => [
        'Denuncia',
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
        'Otra'],
      'disciplinary_stage_options' => [
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
      ],
      'penal_situation_options' => [
        'Indiciado',
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
        'Otros'
      ],
      'fiscal_situation_options' => [
        'Indiciado',
        'Imputado',
        'Responsable fiscalmente',
        'Absuelto',
        'No aplica',
        'No disponible',
        'Otros'
      ],

      'disciplinary_situation_options'=> [
        'Investigado',
        'Disciplinado',
        'Suspendido',
        'Reintegrado',
        'Sancionado',
        'No aplica',
        'No disponible',
        'Otros'
      ],
      'crime_options' => [
        'Utilización de información y de influencias derivadas del ejercicio de función pública',
        'Abusos de autoridad y otras infracciones',
        'Alteración de resultados electorales',
        'Asesoramiento y otras actuaciones ilegales',
        'Celebración indebida de contratos',
        'Cohecho',
        'Colusión en la contratación pública',
        'Concierto para delinquir',
        'Concusión',
        'Constreñimiento al sufragante',
        'Corrupción al sufragante',
        'Denegación de inscripción',
        'Detrimento patrimonial',
        'Elección ilícita de candidatos',
        'Enriquecimiento ilícito por hechos de corrupción',
        'Falsedad en documento privado',
        'Falsedad en documento público',
        'Favorecimiento de voto fraudulento',
        'Financiación de campañas electorales con fuentes prohibidas',
        'Fraude a resolución judicial o administrativa',
        'Fraude al sufragante',
        'Fraude en la inscripción de cédulas',
        'Fraude procesal',
        'Fraudes',
        'Mora en la entrega de documentos relcionados con una votación',
        'No Aplica',
        'No Disponible',
        'Ocultamiento, retención y posesión ilícita de cédula',
        'Omisión de información del aportante',
        'Omisión del agente retenedor o recaudador',
        'Otros',
        'Peculado',
        'Pérdida de documento público',
        'Perturbación de certamen democrático',
        'Prevaricato',
        'Simulación de investidura o cargo',
        'Soborno Transnacional',
        'Tráfico de influencias',
        'Tráfico de votos',
        'Urbanización Ilegal',
        'Usurpación y Abuso de funciones públicas',
        'Violación de los topes o límites de gastos en las campañas electorales',
        'Violación del régimen legal o constitucional de inhabilidades e incompatibilidades',
        'Voto fraudulento'
      ],
      'tools_options' => [
        'Derecho de petición',
        'Queja', 
        'Denuncia',
        'Acción de tutela',
        'Acción de grupo',
        'Acción popular',
        'Acción de cumplimiento',
        'Consulta previa',
        'Solicitud de Revocatoria directa',
        'otras ¿Cuáles? Rellenar',
      ]
    }
  end

  def participation_options
    participation_select = [
      'Actor beneficiado', 
      'Actor de conocimiento', 
      'Actor denunciante', 
      'Actor involucrado', 
      'No disponible'
    ]
  end
  def kind_answer_options
    kind_answer_select = [
      'Escrita',
      'Telefónica',
      'Personal'
    ]
  end 

  def characterization_form_options
    {
      'status_options' => [
        'Procede',
        'No procede',
        'Archivado',
        'Duplicado'
      ],
      'scope_options' => [
        'Local',
        'Nacional',
        'Transnacional'
      ],
      'authority_options' => [
        'Fiscalía',
        'Procuraduría',
        'Contraloría',
        'Otro'
      ],
      'tools' => [
        'Queja',
        'Denuncia',
        'Acción de tutela',
        'Acción de grupo',
        'Acción popular',
        'Acción de cumplimiento',
        'Consulta previa',
        'Solicitud de Revocatoria directa',
        'Otros'
      ]
    }
  end

  def corruption_options 
    corruption_select = [
      'Corrupción administrativa',
      'Corrupción judicial',
      'Corrupción política',
      'Corrupción privada',
      'No aplica',
      'No disponible',
      'Otros'
    ]
  end

  def affected_area_options
    {
      'Corrupción administrativa' => [
        'Empleo público',
        'Contratación',
        'Planeación',
        'Presupuesto y Gasto público',
        'Regulación, Licenciamiento y Trámites',
        'Seguridad y Convivencia',
        'Bienes y servicios'
      ],
      'Corrupción judicial' => [
        'Empleo y altos cargos',
        'Funciones jurisdiccionales',
        'Trámites y servicios judiciales / Acceso a la justicia'
      ],
      'Corrupción política' => [
        'Empleo público',
        'Contratación pública',
        'Planeación',
        'Presupuesto y Gasto Público',
        'Regulación, Licenciamiento y Trámites',
        'Bienes y Servicios',
        'Delitos Electorales'
      ],
      'Corrupción privada' => [
        'En relación con entidades públicas',
        'En relación con otras entidades o individuos',
        'Financiación de campañas políticas',
        'Casos de colusión y/o obstrucción a la libre competencia',
        'Lavado de activos, evasión de impuestos y contrabando'
      ]
    }
  end

  def affected_sector
    affected_sector_select = [
      'Educación, ciencia y tecnología',
      'Defensa y seguridad',
      'Salud y protección social',
      'Trabajo',
      'Hacienda',
      'Judicial',
      'Minas y energía',
      'Paz',
      'Transporte',
      'Inclusión social',
      'Vivienda, ordenamiento territorial y servicios púlicos',
      'Agropecuario',
      'Electoral',
      'Presidencia de la república',
      'Interior',
      'Planeación y estadística',
      'Turismo, industria y comercio',
      'Ambiente',
      'Cultura, recreación y deporte',
      'Tecnologías de la Información - TIC´s',
      'Infraestructura'
    ]
  end

  def rights_violated 
    rights_violated_select = [
      'Derecho al sufragio',
      'Derecho al debido proceso',
      'Dignidad Humana',
      'Derecho al trabajo',
      'Derecho a la seguridad social',
      'Derecho a la salud',
      'Derecho a la educación',
      'Derecho a vivienda digna',
      'Derecho al medio ambiente sano',
      'Derecho a la igualdad',
      'Derecho de petición',
      'Derecho al mínimo vital',
      'Derecho de locomoción',
      'Derecho a la equidad',
      'Derecho a la vida',
      'Derecho al acceso al agua',
      'Derecho a la Paz',
      'Derecho a la Libertad (en general, de cultos, de conciencia, de enseñanza, personalidad, asociacion, etc).',
      'Moralidad administrativa',
      'Derecho a la salubridad pública',
      'Derecho a la conservación de recursos naturales',
      'Derecho al espacio público',
      'Derecho al acceso a servicios públicos domiciliarios',
      'Derecho al reconocimiento de personalidad jurídica',
      'Derechos del consumidor',
      'Derecho a la libre competencia', 
      'Derecho al acceso a la justicia',
      'Derecho de los niños',
      'Derechos y garantías a las personas de la tercera edad',
      'Derecho a la cultura, recreación y deporte',
      'Derecho al acceso a la tierra',
      'Derecho a la no discriminación',
      'Derecho de propiedad',
      'Derecho a elegir y ser elegido',
      'Habeas data',
      'Otro'
    ]
  end

  def kind_responsability
    kind_responsability_select = [
      'Penal',
      'Fiscal',
      'Disciplinaria',
      'Patrimonial',
      'Otra'
    ]
  end 

  def crime 
    crime_select = [
      'Utilización de información y de influencias derivadas del ejercicio de la función pública',
      'Abusos de autoridad y otras infracciones',
      'Alteración de resultados electorales',
      'Asesoriamiento y otras actuaciones ilegales',
      'Celebración indebida de contratos',
      'Cohecho',
      'Colusión en la contratación pública',
      'Concierto para delinquir',
      'Concusión',
      'Constreñimiento al sufragante',
      'Corrupción al sufragante',
      'Denegación de inscripción',
      'Detrimento patrimonial',
      'Elección ilícita de los candidatos',
      'Enriquecimiento ilícito por hechos de corrupción',
      'Falsedad en documento privado',
      'Falsedad en documento público',
      'Favorecimiento de voto fraudulento',
      'Financiación de campañas electorales con fuentes prohibidas',
      'Fraude a resolución judicial o administrativa',
      'Fraude al sufragante',
      'Fraude en la inscripción de cédulas',
      'Fraude procesal',
      'Fraudes',
      'Mora en la entrega de documentos relacionados con una votación',
      'No aplica',
      'No disponible',
      'Ocultamiento, retención y posesión ilícita de cédula',
      'Omisión de información del aportante',
      'Omisión del agente retenedor o recaudador',
      'Otros',
      'Peculado',
      'Pérdida de documento público',
      'Perturbación de certámen democrácico',
      'Prevaricato',
      'Simulación de investidura o cargo',
      'Soborno transnacional',
      'Tráfico de influencias',
      'Tráfico de votos',
      'Urbanización ilegal',
      'Usurpación y Abuso de funciones públicas',
      'Violación de los topes o límites de gastos en las campañas electorales',
      'Violación del régimen legal o constitucional de inhabilidades e incompatibilidades',
      'Voto fraudulento'
    ]
  end
end
