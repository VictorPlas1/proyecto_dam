class Paciente {
  int? idPaciente;
  String? nombre;
  String? contrasena;
  String? correo;
  int? edad;
  String? genero;
  String? servicios;
  String? proximaCita;
  int? habilidaLogo;
  int? habilidadPsic;
  int? habilidadMotriz;
  //Getter y Setter
  int? get getIdPaciente => this.idPaciente;
  set setIdPaciente(int? idPaciente) => this.idPaciente = idPaciente;
  get getNombre => this.nombre;
  set setNombre(nombre) => this.nombre = nombre;
  get getContrasena => this.contrasena;
  set setContrasena(contrasena) => this.contrasena = contrasena;
  get getCorreo => this.correo;
  set setCorreo(correo) => this.correo = correo;
  get getEdad => this.edad;
  set setEdad(edad) => this.edad = edad;
  get getGenero => this.genero;
  set setGenero(genero) => this.genero = genero;
  get getServicios => this.servicios;
  set setServicios(servicios) => this.servicios = servicios;
  get getProximaCita => this.proximaCita;
  set setProximaCita(proximaCita) => this.proximaCita = proximaCita;
  get getHabilidaLogo => this.habilidaLogo;
  set setHabilidaLogo(habilidaLogo) => this.habilidaLogo = habilidaLogo;
  get getHabilidadPsic => this.habilidadPsic;
  set setHabilidadPsic(habilidadPsic) => this.habilidadPsic = habilidadPsic;
  get getHabilidadMotriz => this.habilidadMotriz;
  set setHabilidadMotriz(habilidadMotriz) =>
      this.habilidadMotriz = habilidadMotriz;
}
