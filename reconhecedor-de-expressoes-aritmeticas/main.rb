require_relative "earley"
require_relative "cyk"
require_relative "gramatica"

#Earley
regrasEarley = [
  Regra.new('S', %w[N]),
  Regra.new('S', %w[S O S]),
  Regra.new('S', %w[P]),

  Regra.new('N', %w[N O M]),
  Regra.new('N', %w[M]),

  Regra.new('M', %w[F]),
  Regra.new('M', %w[M O F]),

  Regra.new('F', %w[P]),
  Regra.new('F', %w[E]),

  Regra.new('E', %w[E PO N]),
  Regra.new('E', %w[NEG N]),
  Regra.new('E', %w[N]),

  Regra.new('O', %w[+]),
  Regra.new('O', %w[-]),
  Regra.new('O', %w[*]),
  Regra.new('O', %w[/]),
  Regra.new('PO', %w[^]),
  Regra.new('NEG', %w[-]),

  Regra.new('P', %w[( S )]),
  Regra.new('P', %w[D]),

  Regra.new('D', %w[0]),
  Regra.new('D', %w[1]),
  Regra.new('D', %w[2]),
  Regra.new('D', %w[3]),
  Regra.new('D', %w[4]),
  Regra.new('D', %w[5]),
  Regra.new('D', %w[6]),
  Regra.new('D', %w[7]),
  Regra.new('D', %w[8]),
  Regra.new('D', %w[9])

]

#Cyk
regrasCyk = [
  Regra.new('S', %w[0]),
  Regra.new('S', %w[1]),
  Regra.new('S', %w[2]),
  Regra.new('S', %w[3]),
  Regra.new('S', %w[4]),
  Regra.new('S', %w[5]),
  Regra.new('S', %w[6]),
  Regra.new('S', %w[7]),
  Regra.new('S', %w[8]),
  Regra.new('S', %w[9]),
  
  Regra.new('S', %w[S A]),
  Regra.new('S', %w[PE S]),
  Regra.new('S', %w[S PD]),
  
  Regra.new('O', %w[+]),
  Regra.new('O', %w[-]),
  Regra.new('F', %w[*]),
  Regra.new('F', %w[/]),
  Regra.new('F', %w[^]),

  Regra.new('PE', %w[(]),
  Regra.new('PD', %w[)]),

  Regra.new('A', %w[F S]),
]

gramaticaEarley = Gramatica.new(regrasEarley, "S")
gramaticaCyk = Gramatica.new(regrasCyk, "S")

parser = EarleyParser.new(gramaticaEarley)
parser = CYKParser.new(gramaticaCyk)

# Exemplo - Certo
input = "9^(1*6/2+4)"
puts parser.parse(input) ? 'Aceito' : 'Rejeitado'
puts "\n"


# Exemplo - Errado
# input = "9*2+"
# puts parser.parse(input) ? 'Aceito' : 'Rejeitado'
# puts "\n"
