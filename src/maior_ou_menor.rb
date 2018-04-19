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

def numero_secreto_igual_numero_jogador(numero_secreto, numero_jogador)
  igual = numero_secreto == numero_jogador
  igual
end

def numero_secreto_maior_numero_jogador(numero_secreto, numero_do_jogador)
  maior = numero_secreto > numero_do_jogador
  maior
end

def verificar_se_jogador_acertou(numero_secreto, numero_do_jogador)
  if numero_secreto_igual_numero_jogador(numero_secreto, numero_do_jogador)
    puts 'Paranbés! Parece que temos uma pessoa de sorte aqui, você venceu :)'
    return true
  end
  if numero_secreto_maior_numero_jogador(numero_secreto, numero_do_jogador)
    puts 'O número secreto é maior!'
  else
    puts 'O número secreto é menor!'
  end
  false
end

def informar_numeros_chutados(chute, chutes)
  chutes << chute
  puts "Chutes até agora: #{chutes}"
end

def executar_jogo(qtd_max_tentativas, numero_secreto)
  chutes = []
  total_de_chutes = 0
  for tentativa in 1..qtd_max_tentativas
    puts "Você possuiu #{qtd_max_tentativas} tentativas, essa é a de número: #{tentativa}"
    chute = obter_numero_escolhido_jogador
    informar_numeros_chutados(chute, chutes)
    total_de_chutes += 1
    break if verificar_se_jogador_acertou(numero_secreto, chute)
  end
end

dar_boas_vindas
executar_jogo(obter_qtd_maxima_tentativas, sortear_numero_secreto)
