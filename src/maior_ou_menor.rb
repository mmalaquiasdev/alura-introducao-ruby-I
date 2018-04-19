puts 'Bem vindo ao jogo de adivinhação'
puts 'Qual o seu nome caro jogador?'

nome = gets

puts 'Já vamos começar um novo jogo para você, ' + nome
puts 'Tente advinhar nosso número secreto entre 0 e 200...'

numero_secreto = 175

numero_tentativas_possiveis = 5

for tentativa in 1..numero_tentativas_possiveis
  puts "Você possuiu #{numero_tentativas_possiveis} tentativas, essa é a de número: #{tentativa}"
  puts 'Informe um número: '
  
  chute = gets
  chute = chute.chomp 
  
  puts 'Opa! Então você finalmente se decidiu... '
  puts 'Estou torcendo por você (ou não rsrs)'
  puts "Será que o número #{chute}, é o certo?"

  if numero_secreto == chute.to_i
    puts 'Paranbés! Parece que temos uma pessoa de sorte aqui, você venceu :)'
    break
else 
  if numero_secreto > chute.to_i
        puts 'O número secreto é maior!'
     else
        puts 'O número secreto é menor!'
     end
  end
end