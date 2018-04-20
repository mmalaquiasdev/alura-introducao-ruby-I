QNT_MAXIMA_TENTATIVAS = 5
MAX_PONTOS_JOGADOR = 1000

def imprimir_castelo_boas_vindas
  puts
  puts "        P  /_\  P                              "
  puts "       /_\_|_|_/_\                             "
  puts "   n_n | ||. .|| | n_n         Bem vindo ao    "
  puts "   |_|_|nnnn nnnn|_|_|     Jogo de Adivinhação!"
  puts "  |' '  |  |_|  |'  ' |                        "
  puts "  |_____| ' _ ' |_____|                        " 
  puts "        \__|_|__/                              "
  puts
end

def imprimir_sorriso_da_vitoria
  puts
  puts "             OOOOOOOOOOO               "
  puts "         OOOOOOOOOOOOOOOOOOO           "
  puts "      OOOOOO  OOOOOOOOO  OOOOOO        "
  puts "    OOOOOO      OOOOO      OOOOOO      "
  puts "  OOOOOOOO  #   OOOOO  #   OOOOOOOO    "
  puts " OOOOOOOOOO    OOOOOOO    OOOOOOOOOO   "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO  "
  puts "OOOO  OOOOOOOOOOOOOOOOOOOOOOOOO  OOOO  "
  puts " OOOO  OOOOOOOOOOOOOOOOOOOOOOO  OOOO   "
  puts "  OOOO   OOOOOOOOOOOOOOOOOOOO  OOOO    "
  puts "    OOOOO   OOOOOOOOOOOOOOO   OOOO     "
  puts "      OOOOOO   OOOOOOOOO   OOOOOO      "
  puts "         OOOOOO         OOOOOO         "
  puts "             OOOOOOOOOOOO              "
  puts
  puts "               Acertou!                "
  puts
end

def dar_boas_vindas
  imprimir_castelo_boas_vindas
  puts 'Qual o seu nome caro jogador?'
  nome = gets
  puts 'Ja vamos começar um novo jogo para você, ' + nome
end

def obter_nivel_dificuldade(dificuldade)
  maximo = 0
  case dificuldade
  when 1
    maximo = 30
  when 2
    maximo = 60
  when 3
    maximo = 100
  when 4
    maximo = 150
  else
    maximo = 200
  end
end

def sortear_numero_secreto(dificuldade)
  nivel = obter_nivel_dificuldade(dificuldade)
  puts "Tente advinhar nosso número secreto entre 1 e #{nivel}..."
  rand(nivel) + 1
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
    imprimir_sorriso_da_vitoria
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
  pontos_ate_agora = pontos_ate_agora - pontos_a_perder
end

def definir_dificuldade
  puts '(1) Muito fácil (2) Fácil (3) Normal (4) Difícil (5) Impossível'  
  gets.to_i
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

def encerrar_jogo?
  puts 'Desejar encerrar o jogo? (S/N)'
  encerrar_jogo = gets.strip
  encerrar_jogo.casecmp('S').zero?
end

def jogar
  numero_secreto = sortear_numero_secreto(definir_dificuldade)
  pontos_conquistados = executar_jogo(QNT_MAXIMA_TENTATIVAS, numero_secreto, MAX_PONTOS_JOGADOR)
  puts "O número secreto é: #{numero_secreto}"
  puts "Você ganhou #{pontos_conquistados} pontos."
end

dar_boas_vindas

loop do
  jogar
  break if encerrar_jogo?
end