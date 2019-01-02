file=File.open('Anexos/Data.xml')
puts file.readlines

#todo lo que este en el xml se borrara porque acontinuacion se abrira en modo "write" 
file = File.open('Anexos/Data.xml','w')
=begin
    
file.puts('Escribiendo.. Hola Mund1')
file.puts('Escribiendo.. Hola Mundo2')
file.puts('Escribiendo.. Hola Mundo3')
file.puts('Escribiendo.. Hola Mundo4')
=end
file.puts('Escribiendo.. prueba final')

file.close()

file=File.open('Anexos/Data.xml')
puts file.readlines


