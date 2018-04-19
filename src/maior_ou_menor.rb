QNT_MAXIMA_TENTATIVAS = 5

def dar_boas_vindas
  puts 'Bem vindo ao jogo de adivinha√ß√£o'
  puts 'Qual o seu nome caro jogador?'
  nome = gets
  puts 'J√° vamos come√ßar um novo jogo para voc√™, ' + nome
end

def sortear_numero_secreto
  puts 'Tente advinhar nosso n√∫mero secreto entre 0 e 200...'
  rand(200)
end

def obter_numero_escolhido_jogador
  puts 'Informe um n√∫mero: '
  numero_escolhido = gets
  numero_escolhido = numero_escolhido.chomp
  puts 'Opa! Ent√£o voc√™ finalmente se decidiu... '
  puts 'Estou torcendo por voc√™ (ou n√£o rsrs)'
  puts "Ser√° que o n√∫mero #{numero_escolhido}, √© o certo?"
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
    puts 'Paranb√©s! Parece que temos uma pessoa de sorte aqui, voc√™ venceu :)'
    return true
  end

  if numero_secreto_maior_numero_jogador(numero_secreto, numero_do_jogador)
    puts 'O n√∫mero secreto √© maior!'
  else
    puts 'O n√∫mero secreto √© menor!'
  end

  false
end

def informar_numeros_chutados(chute, chutes)
  chutes << chute
  puts "Chutes at√© agora: #{chutes}"
end

def executar_jogo(qtd_max_tentativas, numero_secreto)
  chutes = []
  Array.new(qtd_max_tentativas).each_index do |tentativa|
    puts "Voc√™ possuiu #{qtd_max_tentativas} tentativas, essa √© a de n√∫mero: #{tentativa}"
    chute = obter_numero_escolhido_jogador
    informar_numeros_chutados(chute, chutes)
    break if verificar_se_jogador_acertou(numero_secreto, chute)
  end
end

dar_boas_vindas
executar_jogo(QNT_MAXIMA_TENTATIVAS, sortear_numero_secreto)
