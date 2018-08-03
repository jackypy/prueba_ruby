opcion = 0

txt_menu = <<menu
  1. nombre de alumno y el promedio de notas.
  2. cantidad de inasistencias totales.
  3. nombres de los alumnos aprobados.
  4. salir.
menu

def opcion_1
  alumnos = File.read('alumnos.csv')
  promedios = ''
  alumnos.split("\n").map do |alm|
     alumno = alm.split(',')
     nom_alumno = alumno[0]
     total = alumno.inject(0) { |suma, item| suma + item.to_i }
     prom_alumno = total.to_f / (alumno.length - 1)
     print "alumno: #{nom_alumno}, promedio: #{prom_alumno}\n"
     promedios += "alumno: #{nom_alumno}, promedio: #{prom_alumno}\n"
   end
   File.write('promedios.csv', 'promedios')
end

def opcion_2
  alumnos = File.read('alumnos.csv')
  todos = []
  alumnos.split("\n").map do |alm|
    todos << alm.split(',')
  end
  inasi = 0
  todos.flatten.each do |valor|
    inasi += 1 if valor.delete(' ') == 'A'
  end
  puts "Las inasistencias totales son #{inasi}"
end

def opcion_3
  alumnos = File.read('alumnos.csv')
  promedios = ''
  alumnos.split("\n").map do |alm|
     alumno = alm.split(',')
     nom_alumno = alumno[0]
     total = alumno.inject(0) { |suma, item| suma + item.to_i }
     prom_alumno = total.to_f / (alumno.length - 1)
     alumnos_aprob = prom_alumno >= 5? 'Aprobado' : 'Reprobado'
     print "alumno: #{nom_alumno}, #{alumnos_aprob}\n"
   end
end

while opcion != 4
  print txt_menu
  opcion = gets.to_i
  case opcion
    when 1
      opcion_1
    when 2
      opcion_2
    when 3
      opcion_3
    when 4
      print "Elejiste salir\n"
    else
      print "Error de opcion\n"
    end
end
