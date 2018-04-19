puts 'Bem vindo ao jogo de adivinhação'
puts 'Qual o seu nome caro jogador?'

nome = gets

puts 'Já vamos começar um novo jogo para você, ' + nome
puts 'Tente advinhar nosso número secreto entre 0 e 200...'

numero_secreto = 175

puts 'Você possuiu três tentativas, essa é a de número: 1'
puts 'Informe um número: '

chute = gets
chute = chute.chomp

puts 'Opa! Então você finalmente se decidiu... '
puts 'Estou torcendo por você (ou não rsrs)'
puts "Será que o número #{chute}, é o certo?"

puts chute.to_i == numero_secreto