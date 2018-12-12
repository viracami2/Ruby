require 'net/http'
require 'date'
require 'json'

require 'nokogiri'

numero =12
fecha = DateTime.now()
vencimiento = DateTime.now()+5 # mas 5 dias
hora = fecha.strftime("%H:%M:%S")
tipofactura='FA'
formadepago='1'

#Totales
  bruto=80;
  base=80;
  descuentos=0;
  cargos=0;
  general=80;
=begin
  para crear fechas 
puts DateTime.new(2001,2,3)  
=end 

#arrayDeCorreos = Array.new('vir' , 'aqui')
arrayDeCorreos = [
  "ceo@example.com",
  "admin@example.com",  
];

#Datos del cliente
arrayCliente = [
  "Looney Toons" ,#nombre 
  "1102231921"   ,#numero 
  "Cra #40 calle 20-12",#Direccion 
  "Bolivar",#Departamento
  "Cartagena",   #Ciudad
  "CO" #Codigo del Pais
]

#{'perro' => 'canino', 'gato' => 'felino', 'burro' => 'asno', 12 => 'docena'}
arrayDeLineas = 
  [
    {'Codigo' => '01' ,'Cantidad' => 2 ,'PrecioUnitario' =>  10,'SubTotalLinea' => 20,'ValorTotalItem' =>  '123'} ,
    {'Codigo' => '02', 'Cantidad' => 3 ,'PrecioUnitario' =>  20,'SubTotalLinea' =>60,'ValorTotalItem' =>  '1234'}     
  ]

#for arrayDeLineas in line
#for line in arrayDeLineas do
arrayDeLineas.each do |line|        
  #puts "data-> #{line.to_a[0][:codigo]}"
  puts "data1-> #{line[:codigo]}"
  puts "data2-> #{line["codigo"]}"
  puts "data3-> #{line}"
end


fecha = DateTime.now()
puts fecha.month+2
puts fecha

builder = Nokogiri::XML::Builder.new(:encoding => 'UTF-8') do |xml|  
  xml.Factura do
    xml.Cabecera(Numero:numero , Fecha:fecha , Vencimiento: vencimiento, Hora:hora, TipoFactura:tipofactura, FormaDePago:formadepago)	
    {
    }	
    xml.Notificacion(Tipo:"Mail" , De:"Vcastro@prueba.com") do 
      arrayDeCorreos.each do |correo|
        xml.Para correo
      end
    end
    xml.Cliente(TipoPersona: "1" , TipoRegimen:"2" , TipoIdentificacion:"13" , Numero:arrayCliente[1])do
        xml.Nombre(RazonSocial:arrayCliente[0])
        xml.DireccionFisica(Direccion:arrayCliente[2] , NombreDepartamento:arrayCliente[3],
            NombreCiudad:arrayCliente[4], CodigoPais:arrayCliente[5] )
    end
    xml.Detalle do 
        arrayDeLineas.each do |line|                
        xml.Linea(Codigo: line["codigo"], Cantidad: line["Cantidad"], SubTotalLinea: line["SubTotalLinea"] ,ValorTotalItem: line["ValorTotalItem"])
        end
    end
    xml.Totales(Bruto: bruto, Base: base, Descuentos: descuentos, Cargos: cargos, General: general )
  end

end


PI = 3.1416
puts "Imprimir XML ? si/no"
initialMigration = gets.chomp
=begin
Comentarios de varias 
lineas 
=end
if initialMigration.to_s=='si'
  puts "Iniciando Migracion...#{initialMigration}"
  puts "el valor de PI ES : #{PI}"
  puts "........................XML INICIAL........................"
  puts builder.to_xml
end

uri   = 'https://api-beta.facture.co//'
route = 'JwtAuth/Registration/Login'

routeComplete = "#{uri}#{route}"

tes = Net::HTTP.post URI("#{uri}#{route}"),
               { "u" => "900855614", "p" => "abc123$$" }.to_json,
               "Content-Type" => "application/json"
		   

puts tes.body
puts tes.code

=begin
    ttes = Net::HTTP.post URI('https://api-beta.facture.co//PLColab.Issue/Issue/XML'),
                builder.to_xml,  "Content-Type" => "application/XML"
    puts ttes
=end





