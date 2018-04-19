QNT_MAXIMA_TENTATIVAS = 5
MAX_PONTOS_JOGADOR = 1000

def dar_boas_vindas
  puts 'Bem vindo ao jogo de adivinhação'
  puts 'Qual o seu nome caro jogador?'
  nome = gets
  puts 'Ja vamos começar um novo jogo para você, ' + nome
end

def sortear_numero_secreto
  puts 'Tente advinhar nosso número secreto entre 0 e 200...'
  rand(200)
end

def obter_numero_escolhido_jogador
  puts 'Informe um número: '
  numero_escolhido = gets
  numero_escolhido = numero_escolhido.chomp
  puts 'Opa! Então você finalmente se decidiu... '
  puts 'Estou torcendo por você (ou não rsrs)'
  puts "Será que o número #{numero_escolhido}, esta certo?"
  numero_escolhido.to_i
end

def numero_secreto_igual_numero_jogador(numero_secreto, numero_jogador)
  numero_secreto == numero_jogador
end

def numero_secreto_maior_numero_jogador(numero_secreto, numero_do_jogador)
  numero_secreto > numero_do_jogador
end

def verificar_se_jogador_acertou(numero_secreto, numero_do_jogador)
  if numero_secreto_igual_numero_jogador(numero_secreto, numero_do_jogador)
    puts 'Parabéns! Parece que temos uma pessoa de sorte aqui, você venceu :)'
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
  chutes
end

def calcular_pontos_conquistados(chute, numero_secreto, pontos_ate_agora)
  pontos_a_perder = ((chute - numero_secreto).abs / 2)
  pontos_ate_agora -= pontos_a_perder
end

def executar_jogo(qtd_max_tentativas, numero_secreto, max_pontos_jogador)
  chutes = []
  pontos_ate_agora = 0
  Array.new(qtd_max_tentativas).each_index do |tentativa|
    puts "Voce possuiu #{qtd_max_tentativas} tentativas, essa é a de número: #{tentativa + 1}"
    chute = obter_numero_escolhido_jogador
    informar_numeros_chutados(chute, chutes)
    pontos_ate_agora = calcular_pontos_conquistados(chute, numero_secreto, max_pontos_jogador)
    break if verificar_se_jogador_acertou(numero_secreto, chute)
  end
  pontos_ate_agora
end

dar_boas_vindas
numero_secreto = sortear_numero_secreto
pontos_conquistados = executar_jogo(QNT_MAXIMA_TENTATIVAS, numero_secreto, MAX_PONTOS_JOGADOR)
puts "O número secreto é: #{numero_secreto}"
puts "Você ganhou #{pontos_conquistados} pontos."
