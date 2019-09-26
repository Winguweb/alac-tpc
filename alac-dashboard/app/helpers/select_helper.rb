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

  def crime_options
    crime_select = ['Utilización de información y de influencias derivadas del ejercicio de función pública',
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
    'Voto fraudulento']
  end
end