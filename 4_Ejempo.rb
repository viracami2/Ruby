
def exampleTryCATCH(datoAVerificar)
    begin  
      raise 'A test exception.' if 1==datoAVerificar
    rescue Exception => e  
        puts e.message  
        puts e.backtrace.inspect  
       
    end  

end

puts 'utilizamos un metodo incorrecto para generar el error y capturarlo'
begin
datoAVerificar= gets.chomps()
rescue NoMethodError =>e
    puts "El metodo que estas intentando llamar no existe o no es valido"
    puts e.message
    puts e.backtrace
end

puts 'Digite un numero para validar'
datoAVerificar=gets.chomp.to_i()
            
exampleTryCATCH(datoAVerificar)