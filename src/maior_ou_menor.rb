def obter_qtd_maxima_tentativas
  numero_tentativas_possiveis = 5
  numero_tentativas_possiveis
end

def dar_boas_vindas
  puts 'Bem vindo ao jogo de adivinhação'
  puts 'Qual o seu nome caro jogador?'
  nome = gets
  puts 'Já vamos começar um novo jogo para você, ' + nome
end

def sortear_numero_secreto
  puts 'Tente advinhar nosso número secreto entre 0 e 200...'
  numero_sorteado = 175
  numero_sorteado
end

def obter_numero_escolhido_jogador
  puts 'Informe um número: '
  numero_escolhido = gets
  numero_escolhido = numero_escolhido.chomp
  puts 'Opa! Então você finalmente se decidiu... '
  puts 'Estou torcendo por você (ou não rsrs)'
  puts "Será que o número #{numero_escolhido}, é o certo?"
  numero_escolhido.to_i
end

def verificar_se_jogador_acertou(numero_secreto, numero_escolhido_jogador)
  if numero_secreto == numero_escolhido_jogador
    puts 'Paranbés! Parece que temos uma pessoa de sorte aqui, você venceu :)'
    true
  elsif numero_secreto > numero_escolhido_jogador
    puts 'O número secreto é maior!'
    false
   else
    puts 'O número secreto é menor!'
    false
  end
end

def executar_jogo(qtd_max_tentativas, numero_secreto)
  for tentativa in 1..qtd_max_tentativas
    puts "Você possuiu #{qtd_max_tentativas} tentativas, essa é a de número: #{tentativa}"
    chute = obter_numero_escolhido_jogador
    if verificar_se_jogador_acertou(numero_secreto, chute)
      break
    end
  end
end

dar_boas_vindas
executar_jogo(obter_qtd_maxima_tentativas, sortear_numero_secreto)
