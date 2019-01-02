class Casa
    def initialize(params)
        @barrio = params[:barrio]
        @ciudad = params[:ciudad]

    end

    def barrio 
        @barrio
    end
    def ciudad
        @cuidad
    end
    
    def Presentacion
        puts "La casa esta ubicaca en el barrio  #{@barrio} de la cuidad de  #{@ciudad.capitalize }"

    end

end


casa = Casa.new(barrio:'Nazareno' ,ciudad:'cartagena')
casa.Presentacion()
puts casa.barrio
