
##Creando Metodos.

def saludando
    puts "Mi gente,Lo mas grande de este mundo...! :D"
end

=begin
=end
    
def es_NumeroPar?(numero)
    if numero % 2.0 ==0
        return true;
    end
end

def arrayInitial(numero)
    arra =[1,2]
    
    while numero != 0
        arra.push (arra[-1] + arra[-2])
        numero-=1
    end
    return arra
end

#1  2   3  5  8  13  21   34  55 
def capturarDatosParaPintar(array , pos ,cantiNumero)
entrar=true;
stringDevolver='';
ipos=1;

while entrar
    if ipos >= cantiNumero
        entrar =false;  
    end
        data = "#{array[pos]}   "
        stringDevolver+=data;
        data="";
        pos+=1;
        ipos+=1;
    end
return stringDevolver;
end



def pintar_Fibonacci(arra)
    condicion=true;
    pos =1;
    nroPintadas=2;
    puts arra[0];


    while condicion

        puts capturarDatosParaPintar(arra,pos,nroPintadas)
        if pos >= arra.length 
            condicion=false
        end
        pos=pos+nroPintadas;
        nroPintadas+=1;
    end

end



(1..5).each  do |dato|
    if es_NumeroPar?(dato)
        puts "#{dato} es un numero par"
    else
        puts "#{dato} es impar"
    end 
end
puts "hola mundo  ruby :)"  #Hola mundo en ruby junto a comentarios

puts "-----Operadores matematicos-------"

puts "Suma"
suma = 5+10;
puts"5 + 10 =#{suma}";

puts "Resta"
puts"5 - 10 =#{5-10}";

puts "Multiplicacion"
puts"5 * 10 =#{5*10}";

puts "Potencia "
puts"10 ** 2 =#{10**2}";

puts "Raiz cuadrada usando el modulo Math"
puts"Raiz cuadrade de 25 = #{Math.sqrt(25)}";

puts "Division"
puts "10 / 2 = #{10/2}";

puts "Division con decimales" #el dividendo o el divisor tiene que ser decimal.
puts"10 / 2.0 =#{10/2.0}";

puts "Modulo"
puts"10 % 2 =#{11/2}";

puts "Digite un nombre para validar"
nombre = gets.chomp.to_s();
case nombre
    when 'victor'
        puts "el victorr"
    when 'raul'
        puts "don raul"
    else
        puts "otro integrante"
end
saludando


arraq= arrayInitial(41)
puts pintar_Fibonacci(arraq)