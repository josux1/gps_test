class WialonException implements Exception {
  final int code;
  WialonException(this.code);

  /// Possible Errors in a re-login.
  bool get isSessionError => code == 1 || code == 1011;

  @override
  String toString() => switch (code) {
    -100 => 'Error interno (timeout de red)',
    -101 => 'Error interno (respuesta de red incorrecta)',
    0 => 'Operación exitosa',
    1 => 'Sesión inválida',
    2 => 'Nombre de servicio API inválido',
    3 => 'Resultado inválido',
    4 => 'Parámetros de entrada inválidos',
    5 => 'Error al ejecutar la petición',
    6 => 'Error desconocido',
    7 => 'Acceso denegado',
    8 => 'Usuario o contraseña inválidos',
    9 => 'Servidor de autorización no disponible',
    10 => 'Límite de peticiones concurrentes alcanzado',
    11 => 'Error al restablecer la contraseña',
    12 => 'Subsistema Agro no cargado',
    14 => 'Error de facturación',
    1001 => 'No hay mensajes para el intervalo seleccionado',
    1002 =>
      'Ya existe un ítem con esa propiedad única, o no se puede crear por restricciones de facturación',
    1003 => 'Solo se permite una petición a la vez',
    1004 => 'Se excedió el límite de mensajes',
    1005 => 'El tiempo de ejecución excedió el límite',
    1006 =>
      'Se excedió el límite de intentos del código de autorización de dos factores',
    1011 => 'Tu IP cambió o la sesión expiró',
    2001 => 'Ítem o target_resource incorrecto',
    2002 => 'El target_resource no es una cuenta',
    2003 => 'Plugin de destino incorrecto',
    2004 => 'La cuenta de destino está bloqueada',
    2005 => 'Creador inválido del target_resource',
    2006 => 'Sin acceso al ítem para el target_creator',
    2007 => 'Recurso de origen incorrecto',
    2008 => 'El ítem ya está en el target_resource',
    2009 => 'El target_resource pertenece a otro usuario principal',
    2010 =>
      'No hay suficiente contador de recursos de ítems en el target_resource',
    2011 => 'Plugin del ítem incorrecto',
    2012 =>
      'Error al cambiar el ítem de la cuenta de facturación al target_resource',
    2013 => 'Error al cambiar el creador del ítem',
    2014 =>
      'El usuario seleccionado es creador de objetos del sistema y no puede asignarse a una nueva cuenta',
    2015 =>
      'No se puede eliminar el sensor porque se usa en otro sensor o en propiedades avanzadas de la unidad',
    _ => 'Error Wialon (código $code)',
  };
}
