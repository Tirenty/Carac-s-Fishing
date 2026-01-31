Algoritmo "Caracs Fishing"

Var                //x// //y
   local_peixes:vetor[0..11,0..7] de caracter
   profundidade, v, pX,pY: inteiro

   mexer_peixes_nome:vetor[0..20] de caracter
   mexer_peixes_posiX:vetor[0..20] de inteiro
   mexer_peixes_posiY:vetor[0..20] de inteiro

   melhorias:vetor[0..5] de inteiro
   
   grana, meta_atual, meta_tipalinha, meta_pirocha, meta_vamlula, meta_enguangue, meta_abislapia: inteiro
   metas, op: caracter

   bonus_q, chances, chance_tipalinha, chance_pirocha, chance_vamlula, chance_enguangue, chance_abislapia: inteiro
           chance_tipalinha_b, chance_pirocha_b, chance_vamlula_b, chance_enguangue_b, chance_abislapia_b: inteiro
                     
                          q_total, q_tipalinha, q_pirocha, q_vamlula, q_enguangue, q_abislapia: inteiro
                         q_tipalinha_b, q_pirocha_b, q_vamlula_b, q_enguangue_b, q_abislapia_b: inteiro
   resultado_pesca, fisgado, acao: caracter
   fisgados_arpao:vetor[0..2] de caracter
   arpao_atual: inteiro
   dr_linha, dr_linha_total: inteiro
   diagonal, puxar_soltar: logico

   tipo_pesca: caracter
   
   quantidade_total_peixes: inteiro
procedimento preenche_lago
var
   x, y, y_t, y_p, y_v, y_e, y_a, z, aleator: inteiro
   nome_peixe: caracter
   q_tipalinha_atual, q_pirocha_atual, q_vamlula_atual, q_enguangue_atual, q_abislapia_atual: inteiro
   chance_tipalinha_atual, chance_pirocha_atual, chance_vamlula_atual, chance_enguangue_atual, chance_abislapia_atual: inteiro
inicio
   z <- 0
   
   q_tipalinha_atual <- q_tipalinha + q_tipalinha_b
   chance_tipalinha_atual <- chance_tipalinha + chance_tipalinha_b
   
   q_pirocha_atual <- q_pirocha + q_pirocha_b
   chance_pirocha_atual <- chance_pirocha + chance_pirocha_b
   
   q_vamlula_atual <- q_vamlula + q_vamlula_b
   chance_vamlula_atual <- chance_vamlula + chance_vamlula_b

   q_enguangue_atual <- q_enguangue + q_enguangue_b
   chance_enguangue_atual <- chance_enguangue + chance_enguangue_b

   q_abislapia_atual <- q_abislapia + q_abislapia_b
   chance_abislapia_atual <- chance_abislapia + chance_abislapia_b
   
   quantidade_total_peixes <- 0
   
   para x de 0 ate 11 faca
      para y de 0 ate profundidade faca
          local_peixes[x,y] <- ""
      fimpara
   fimpara
   
   para x de 0 ate 20 faca
       mexer_peixes_nome[x] <- ""
      mexer_peixes_posiX[x] <- -1
      mexer_peixes_posiY[x] <- -1
   fimpara
   
   para x de 0 ate 11 faca
      para y_t de 0 ate 1 faca //TIPALINHA
          aleator <- randi(100)+1
          se (q_tipalinha_atual > 0) e (chance_tipalinha_atual > aleator) e (local_peixes[x,y_t] = "") entao
             q_tipalinha_atual <- q_tipalinha_atual - 1
             
             quantidade_total_peixes <- quantidade_total_peixes + 1

             local_peixes[x,y_t] <- "TIPALINHA"

             mexer_peixes_nome[z] <- local_peixes[x,y_t]
             mexer_peixes_posiX[z] <- x
             mexer_peixes_posiY[z] <- y_t
             
             z <- z + 1
             
          senao
             local_peixes[x,y_t] <- ""
          fimse
      fimpara
      se (meta_atual > 1) entao
         para y_p de 2 ate 3 faca //PIROCHA
             aleator <- randi(100)+1
             se (q_pirocha_atual > 0) e (chance_pirocha_atual > aleator) e (local_peixes[x,y_p] = "") entao
                q_pirocha_atual <- q_pirocha_atual - 1
                
                quantidade_total_peixes <- quantidade_total_peixes + 1
                
                local_peixes[x,y_p] <- "PIROCHA"

                mexer_peixes_nome[z] <- local_peixes[x,y_p]
                mexer_peixes_posiX[z] <- x
                mexer_peixes_posiY[z] <- y_p

                z <- z + 1

             senao
                local_peixes[x,y_p] <- ""
             fimse
         fimpara
      fimse
      se (meta_atual > 3) entao
         se (x > 1) e (x < 10) entao
            para y_v de 4 ate 4 faca //VAMLULA
                aleator <- randi(100)+1
                se (q_vamlula_atual > 0) e (chance_vamlula_atual > aleator) e (local_peixes[x,y_v] = "") entao
                   q_vamlula_atual <- q_vamlula_atual - 1

                   quantidade_total_peixes <- quantidade_total_peixes + 1

                   local_peixes[x,y_v] <- "VAMLULA"

                   mexer_peixes_nome[z] <- local_peixes[x,y_v]
                   mexer_peixes_posiX[z] <- x
                   mexer_peixes_posiY[z] <- y_v

                   z <- z + 1

                senao
                   local_peixes[x,y_v] <- ""
                fimse
            fimpara
         fimse
      fimse
      se (meta_atual > 5) entao
         se (x > 2) e (x < 9) entao
            para y_e de 5 ate 6 faca //ENGUANGUE
                aleator <- randi(100)+1
                se (q_enguangue_atual > 0) e (chance_enguangue_atual > aleator) e (local_peixes[x,y_e] = "") entao
                   q_enguangue_atual <- q_enguangue_atual - 1
                   
                   quantidade_total_peixes <- quantidade_total_peixes + 1
                   
                   local_peixes[x,y_e] <- "ENGUANGUE"

                   mexer_peixes_nome[z] <- local_peixes[x,y_e]
                   mexer_peixes_posiX[z] <- x
                   mexer_peixes_posiY[z] <- y_e

                   z <- z + 1

                senao
                   local_peixes[x,y_e] <- ""
                fimse
            fimpara
         fimse
      fimse
      se (meta_atual > 7) entao
         se (x > 3) e (x < 8) entao
            para y_a de 7 ate 7 faca //ABISLAPIA
                aleator <- randi(100)+1
                se (q_abislapia_atual > 0) e (chance_abislapia_atual > aleator) e (local_peixes[x,y_a] = "") entao
                   q_abislapia_atual <- q_abislapia_atual - 1
                   
                   quantidade_total_peixes <- quantidade_total_peixes + 1
                   
                   local_peixes[x,y_a] <- "ABISLAPIA"

                   mexer_peixes_nome[z] <- local_peixes[x,y_a]
                   mexer_peixes_posiX[z] <- x
                   mexer_peixes_posiY[z] <- y_a

                   z <- z + 1

                senao
                   local_peixes[x,y_a] <- ""
                fimse
            fimpara
         fimse
      fimse
   fimpara
   meta_atual <- meta_atual + 1
fimprocedimento

procedimento apresenta_lago
var
  x, y, zzz: inteiro
inicio
   escreval ("                                 ||||        +--------+--------+--------+--------+--------+--------+--------+--------+--------+--------+--------+--------+        ||||")
   para y de 0 ate profundidade faca

      zzz <- 0
      repita
         escreva ("                                 ||||        |")
         para x de 0 ate 11 faca
              se (local_peixes[x,y] <> "") entao
                 se (local_peixes[x,y] = "ANZOL") ou (local_peixes[x,y] = "ARPAO") entao
                    se (local_peixes[x,y] = "ANZOL") entao
                       se (resultado_pesca = "FISGOU") entao
                          se (zzz = 0) entao
                             escreva("  * \*\ |")
                          senao
                             escreva(" |\_/*/ |")
                          fimse
                       senao
                          se (zzz = 0) entao
                             escreva("    \ \ |")
                          senao
                             escreva(" |\_/ / |")
                          fimse
                       fimse
                    senao // ARPAO
                       se (resultado_pesca = "FISGOU") entao
                          se (zzz = 0) entao
                             escreva(" *_||_* |")
                          senao
                             escreva("  \**/  |")
                          fimse
                       senao
                          se (zzz = 0) entao
                             escreva("  _||_  |")
                          senao
                             escreva("  \`´/  |")
                          fimse
                       fimse
                    fimse
                 senao
                    se (zzz = 0) entao
                       escreva(" /O \/| |")
                    senao
                       escreva(" \__/\| |")
                    fimse
                 fimse
              senao
                 escreva ("        |")
              fimse
         fimpara
         zzz <- zzz + 1
         escreva ("        ||||")
         escreval
      ate (zzz = 2)

      escreval ("                                 ||||        +--------+--------+--------+--------+--------+--------+--------+--------+--------+--------+--------+--------+        ||||")

   fimpara

   para x de 1 ate 22 - (profundidade*3) faca
      escreval
   fimpara

fimprocedimento

procedimento atualiza_lago
var
   z, x, aleator, posicaoX, posicaoY: inteiro
   operacao: caracter
inicio
    z <- -1
    repita
       z <- z + 1
       
       // mexer_peixes_nome[z] <- local_peixes[x,y]
       // mexer_peixes_posiX[z] <- x
       // mexer_peixes_posiY[z] <- y
       
       se (mexer_peixes_nome[z] <> "") entao
          se (mexer_peixes_nome[z] = "TIPALINHA") entao
          
              local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- ""
              
              aleator <- randi(2)
              
              escolha aleator
                 caso 0
                    operacao <- "subtracaoX"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 1
                    se(mexer_peixes_posiX[z] < 0) entao
                      mexer_peixes_posiX[z] <- 0
                    fimse
                 caso 1
                    operacao <- "somaX"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 1
                    se(mexer_peixes_posiX[z] > 11) entao
                      mexer_peixes_posiX[z] <- 11
                    fimse
              fimescolha

              se (local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] = "") entao
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "TIPALINHA"
              senao
                 se (operacao = "subtracaoX") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 1
                 fimse
                 
                 se (operacao = "somaX") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 1
                 fimse
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "TIPALINHA"
              fimse
          fimse
/////////////////////////////////////////////////////////////////////////////////////////////
          se (mexer_peixes_nome[z] = "PIROCHA") entao

              local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- ""

              aleator <- randi(2)

              escolha aleator
                 caso 0
                    operacao <- "subtracaoY"
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] - 1
                    se(mexer_peixes_posiY[z] < 2) entao
                      mexer_peixes_posiY[z] <- 2
                    fimse
                 caso 1
                    operacao <- "somaY"
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] + 1
                    se(mexer_peixes_posiY[z] > 3) entao
                      mexer_peixes_posiY[z] <- 3
                    fimse
                    se(mexer_peixes_posiY[z] > profundidade) entao
                      mexer_peixes_posiY[z] <- profundidade
                    fimse
              fimescolha

              se (local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] = "") entao
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "PIROCHA"
              senao
                 se (operacao = "subtracaoY") entao
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] + 1
                 fimse

                 se (operacao = "somaY") entao
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] - 1
                 fimse
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "PIROCHA"
              fimse
          fimse
          /////////////////////////////////////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////
          se (mexer_peixes_nome[z] = "VAMLULA") entao

              local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- ""

              aleator <- randi(4)

              escolha aleator
                 caso 0
                    operacao <- "subtracaoX_subtracaoY"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 1
                    se(mexer_peixes_posiX[z] < 0) entao
                      mexer_peixes_posiX[z] <- 0
                    fimse
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] - 1
                    se(mexer_peixes_posiY[z] < 4) entao
                      mexer_peixes_posiY[z] <- 4
                    fimse
                 caso 1
                    operacao <- "somaX_somaY"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 1
                    se(mexer_peixes_posiX[z] > 11) entao
                      mexer_peixes_posiX[z] <- 11
                    fimse
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] + 1
                    se(mexer_peixes_posiY[z] > 5) entao
                      mexer_peixes_posiY[z] <- 5
                    fimse
                    se(mexer_peixes_posiY[z] > profundidade) entao
                      mexer_peixes_posiY[z] <- profundidade
                    fimse

                 caso 2
                    operacao <- "subtracaoX_somaY"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 1
                    se(mexer_peixes_posiX[z] < 0) entao
                      mexer_peixes_posiX[z] <- 0
                    fimse
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] + 1
                    se(mexer_peixes_posiY[z] > 5) entao
                      mexer_peixes_posiY[z] <- 5
                    fimse
                    se(mexer_peixes_posiY[z] > profundidade) entao
                      mexer_peixes_posiY[z] <- profundidade
                    fimse
                 caso 3
                    operacao <- "somaX_subtracaoY"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 1
                    se(mexer_peixes_posiX[z] > 11) entao
                      mexer_peixes_posiX[z] <- 11
                    fimse
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] - 1
                    se(mexer_peixes_posiY[z] < 4) entao
                      mexer_peixes_posiY[z] <- 4
                    fimse
              fimescolha

              se (local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] = "") entao
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "VAMLULA"
              senao
                 se (operacao = "subtracaoX_subtracaoY") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 1
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] + 1
                 fimse

                 se (operacao = "somaX_somaY") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 1
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] - 1
                 fimse
                 
                 se (operacao = "subtracaoX_somaY") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 1
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] - 1
                 fimse

                 se (operacao = "somaX_subtracaoY") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 1
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] + 1
                 fimse
                 
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "VAMLULA"

              fimse

          fimse
          /////////////////////////////////////////////////////////////////////////////////////////
          
/////////////////////////////////////////////////////////////////////////////////////////////
          se (mexer_peixes_nome[z] = "ENGUANGUE") entao

              local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- ""

              aleator <- randi(4)

              escolha aleator
                 caso 0
                    operacao <- "subtracaoX"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 1
                    se(mexer_peixes_posiX[z] < 0) entao
                      mexer_peixes_posiX[z] <- 0
                    fimse
                 caso 1
                    operacao <- "somaX"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 1
                    se(mexer_peixes_posiX[z] > 11) entao
                      mexer_peixes_posiX[z] <- 11
                    fimse
                 caso 2
                    operacao <- "subtracaoY"
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] - 1
                    se(mexer_peixes_posiY[z] < 4) entao
                      mexer_peixes_posiY[z] <- 4
                    fimse
                 caso 3
                    operacao <- "somaY"
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] + 1
                    se(mexer_peixes_posiY[z] > 6) entao
                      mexer_peixes_posiY[z] <- 6
                    fimse
                    se(mexer_peixes_posiY[z] > profundidade) entao
                      mexer_peixes_posiY[z] <- profundidade
                    fimse
              fimescolha

              se (local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] = "") entao
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "ENGUANGUE"
              senao
                 se (operacao = "subtracaoX") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 1
                 fimse

                 se (operacao = "somaX") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 1
                 fimse
                 
                 se (operacao = "subtracaoY") entao
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] + 1
                 fimse

                 se (operacao = "somaY") entao
                    mexer_peixes_posiY[z] <- mexer_peixes_posiY[z] - 1
                 fimse
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "ENGUANGUE"
              fimse
          fimse
          /////////////////////////////////////////////////////////////////////////////////////////
          se (mexer_peixes_nome[z] = "ABISLAPIA") entao

              local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- ""

              aleator <- randi(2)

              escolha aleator
                 caso 0
                    operacao <- "subtracaoX"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 2
                    se(mexer_peixes_posiX[z] < 0) entao
                      mexer_peixes_posiX[z] <- 0
                    fimse
                 caso 1
                    operacao <- "somaX"
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 2
                    se(mexer_peixes_posiX[z] > 11) entao
                      mexer_peixes_posiX[z] <- 11
                    fimse
              fimescolha

              se (local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] = "") entao
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "ABISLAPIA"
              senao
                 se (operacao = "subtracaoX") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] + 2
                 fimse

                 se (operacao = "somaX") entao
                    mexer_peixes_posiX[z] <- mexer_peixes_posiX[z] - 2
                 fimse
                 local_peixes[mexer_peixes_posiX[z], mexer_peixes_posiY[z]] <- "ABISLAPIA"
              fimse
          fimse
/////////////////////////////////////////////////////////////////////////////////////////////
       fimse
    ate(mexer_peixes_nome[z] = "")

fimprocedimento

procedimento opcoes
var
inicio
   escreva("                                                                            D I G I T E   A Q U I   S U A   O P Ç Ã O: ")
   leia(op)
   
   escolha op
      caso "1"
         aprimoramentos
      caso "2"
         modificar_lago
      caso "3"
         se (meta_atual > 5) entao
            se (tipo_pesca = "ANZOL") entao
                tipo_pesca <- "ARPAO"
            senao
                tipo_pesca <- "ANZOL"
            fimse
         fimse
      caso "4"
         preenche_lago
      caso "5"
         dr_linha <- dr_linha_total
         se (tipo_pesca = "ANZOL") entao
            pesca_anzol
         senao
            pesca_arpao
         fimse
   fimescolha
fimprocedimento

procedimento liberou_arpao
var
   op: caracter
inicio
         limpatela
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval ("                                    __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __    ")
         escreval ("                                   /   __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  \  ")
         escreval ("                                  /  /                                |                                                          | Durante a pesca, este pode ser\  \ ")
         escreval ("                                 |  | Para equipá-lo, pressione < 3 > |      A R P Ã O   L I B E R A D O         |\_             | lançado  em  qualquer  uma das |  |")
         escreval ("                                 |  | na tela inicial.                |                                          |  \_           | casas iniciais.                |  |")
         escreval ("                                 |  |                                 |                                          |\   \_         |                                |  |")
         escreval ("                                 |  | Para desequipar, faça  o  mesmo |        ,--------------------------------´  \    \_       | Porém,  só pode ir para baixo, |  |")
         escreval ("                                 |  | enquanto estiver  equipado para |       |                                     >    _>      | podendo ser puxado  no momento |  |")
         escreval ("                                 |  | voltar ao ANZOL.                |        `--------------------------------.  /   _/        | que preferir.                  |  |")
         escreval ("                                 |  |                                 |                                          |/  _/          |                                |  |")
         escreval ("                                 |  |  A MOVIMENTAÇÃO AUMENTADA e o   |                                          | _/            | Permite coletar até  3  peixes |  |")
         escreval ("                                 |  |  CONTROLE DE PROFUNDIDADE não   |                                          |/              | em  uma  mesma  vez,  todavia, |  |")
         escreval ("                                 |  |  afetam o ARPÃO, só os demais   |                                                          | ainda consome  a  durabilidade |  |")
         escreval ("                                  \  \ __  __  __  __  __  __  __  __ |__  __  __  __  __  __  __  __  __  __  __  __  __  __  __| ao contato. __  __  __  __  __/  / ")
         escreval ("                                   \__  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __ /  ")
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreval
         escreva("                                                                            D I G I T E   E N T E R   P A R A   R E T O R N A R                                                                                                                                                                                         ")
         leia(op)
fimprocedimento


procedimento atualizar_metas
var
   metamax_tipalinha, metamax_pirocha, metamax_vamlula, metamax_enguangue, metamax_abislapia:inteiro
   bateu_meta: logico
inicio
      
   bateu_meta <- falso
   se (meta_atual = 1) entao
      q_tipalinha <- 1
      chance_tipalinha <- 30
      
      metamax_tipalinha <- 2
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      
      metas <- metas + (" )")
      se (meta_tipalinha >= metamax_tipalinha) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          
          chances <- chances + 10
      fimse
   fimse

   se (meta_atual = 2) entao
      q_tipalinha <- 2
    
      q_pirocha <- 1
      chance_pirocha <- 30
   
      metamax_tipalinha <- 3
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      metamax_pirocha <- 1
      metas <- metas + " | PIROCHA "
      metas <- metas + numpcarac(meta_pirocha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_pirocha)
      metas <- metas + (" )")
      
      se (meta_tipalinha >= metamax_tipalinha) e (meta_pirocha >= metamax_pirocha) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          meta_pirocha <- 0
          
          q_total <- q_total + 1

      fimse
   fimse
   
   se (meta_atual = 3) entao
      q_pirocha <- 2
   
      metamax_tipalinha <- 4
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      metamax_pirocha <- 3
      metas <- metas + " | PIROCHA "
      metas <- metas + numpcarac(meta_pirocha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_pirocha)
      metas <- metas + (" )")

      se (meta_tipalinha >= metamax_tipalinha) e (meta_pirocha >= metamax_pirocha) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          meta_pirocha <- 0
          
          chances <- chances + 10
      fimse
   fimse
   
   se (meta_atual = 4) entao

      q_vamlula <- 1
      chance_vamlula <- 30

      metamax_tipalinha <- 3
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      metamax_pirocha <- 3
      metas <- metas + " | PIROCHA "
      metas <- metas + numpcarac(meta_pirocha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_pirocha)
      metamax_vamlula <- 2
      metas <- metas + " | VAMLULA "
      metas <- metas + numpcarac(meta_vamlula)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_vamlula)
      metas <- metas + (" )")
      
      se (meta_tipalinha >= metamax_tipalinha) e (meta_pirocha >= metamax_pirocha) e (meta_vamlula >= metamax_vamlula) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          meta_pirocha <- 0
          meta_vamlula <- 0
          
          q_total <- q_total + 1

      fimse
   fimse
   
   se (meta_atual = 5) entao

      q_vamlula <- 2

      metamax_tipalinha <- 2
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      metamax_pirocha <- 2
      metas <- metas + " | PIROCHA "
      metas <- metas + numpcarac(meta_pirocha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_pirocha)
      metamax_vamlula <- 4
      metas <- metas + " | VAMLULA "
      metas <- metas + numpcarac(meta_vamlula)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_vamlula)
      metas <- metas + (" )")

      se (meta_tipalinha >= metamax_tipalinha) e (meta_pirocha >= metamax_pirocha) e (meta_vamlula >= metamax_vamlula) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          meta_pirocha <- 0
          meta_vamlula <- 0

          chances <- chances + 10
          
          liberou_arpao// AQUI LIBERA O ARPÃO
      fimse
   fimse
   
   se (meta_atual = 6) entao

      q_enguangue <- 1
      chance_enguangue <- 30

      metamax_tipalinha <- 2
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      metamax_pirocha <- 2
      metas <- metas + " | PIROCHA "
      metas <- metas + numpcarac(meta_pirocha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_pirocha)
      metamax_vamlula <- 2
      metas <- metas + " | VAMLULA "
      metas <- metas + numpcarac(meta_vamlula)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_vamlula)
      metamax_enguangue <- 2
      metas <- metas + " | ENGUANGUE "
      metas <- metas + numpcarac(meta_enguangue)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_enguangue)
      metas <- metas + (" )")
      
      se (meta_tipalinha >= metamax_tipalinha) e (meta_pirocha >= metamax_pirocha) e (meta_vamlula >= metamax_vamlula) e (meta_enguangue >= metamax_enguangue) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          meta_pirocha <- 0
          meta_vamlula <- 0
          meta_enguangue <- 0
          
          q_total <- q_total + 1
          
      fimse
   fimse
   
   se (meta_atual = 7) entao

      q_enguangue <- 2

      metamax_tipalinha <- 3
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      metamax_pirocha <- 3
      metas <- metas + " | PIROCHA "
      metas <- metas + numpcarac(meta_pirocha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_pirocha)
      metamax_vamlula <- 3
      metas <- metas + " | VAMLULA "
      metas <- metas + numpcarac(meta_vamlula)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_vamlula)
      metamax_enguangue <- 3
      metas <- metas + " | ENGUANGUE "
      metas <- metas + numpcarac(meta_enguangue)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_enguangue)
      metas <- metas + (" )")

      se (meta_tipalinha >= metamax_tipalinha) e (meta_pirocha >= metamax_pirocha) e (meta_vamlula >= metamax_vamlula) e (meta_enguangue >= metamax_enguangue) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          meta_pirocha <- 0
          meta_vamlula <- 0
          meta_enguangue <- 0

          chances <- chances + 10
      fimse
   fimse

   se (meta_atual = 8) entao

      q_abislapia <- 1
      chance_abislapia <- 30

      metamax_tipalinha <- 2
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      metamax_pirocha <- 2
      metas <- metas + " | PIROCHA "
      metas <- metas + numpcarac(meta_pirocha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_pirocha)
      metamax_vamlula <- 2
      metas <- metas + " | VAMLULA "
      metas <- metas + numpcarac(meta_vamlula)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_vamlula)
      metamax_enguangue <- 2
      metas <- metas + " | ENGUANGUE "
      metas <- metas + numpcarac(meta_enguangue)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_enguangue)
      metamax_abislapia <- 3
      metas <- metas + " | ABISLAPIA "
      metas <- metas + numpcarac(meta_abislapia)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_abislapia)
      metas <- metas + (" )")
      
      se (meta_tipalinha >= metamax_tipalinha) e (meta_pirocha >= metamax_pirocha) e (meta_vamlula >= metamax_vamlula) e (meta_enguangue >= metamax_enguangue) e (meta_abislapia >= metamax_abislapia) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          meta_pirocha <- 0
          meta_vamlula <- 0
          meta_enguangue <- 0
          meta_abislapia <- 0
          
          q_total <- q_total + 1
      fimse
   fimse
   
   se (meta_atual = 9) entao

      q_abislapia <- 2

      metamax_tipalinha <- 4
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      metamax_pirocha <- 4
      metas <- metas + " | PIROCHA "
      metas <- metas + numpcarac(meta_pirocha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_pirocha)
      metamax_vamlula <- 4
      metas <- metas + " | VAMLULA "
      metas <- metas + numpcarac(meta_vamlula)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_vamlula)
      metamax_enguangue <- 4
      metas <- metas + " | ENGUANGUE "
      metas <- metas + numpcarac(meta_enguangue)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_enguangue)
      metamax_abislapia <- 4
      metas <- metas + " | ABISLAPIA "
      metas <- metas + numpcarac(meta_abislapia)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_abislapia)
      metas <- metas + (" )")

      se (meta_tipalinha >= metamax_tipalinha) e (meta_pirocha >= metamax_pirocha) e (meta_vamlula >= metamax_vamlula) e (meta_enguangue >= metamax_enguangue) e (meta_abislapia >= metamax_abislapia) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          meta_pirocha <- 0
          meta_vamlula <- 0
          meta_enguangue <- 0
          meta_abislapia <- 0

          chances <- chances + 10
      fimse
   fimse
   
   se (meta_atual = 10) entao

      metamax_tipalinha <- 9
      metas <- "( TIPALINHA "
      metas <- metas + numpcarac(meta_tipalinha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_tipalinha)
      metamax_pirocha <- 8
      metas <- metas + " | PIROCHA "
      metas <- metas + numpcarac(meta_pirocha)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_pirocha)
      metamax_vamlula <- 7
      metas <- metas + " | VAMLULA "
      metas <- metas + numpcarac(meta_vamlula)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_vamlula)
      metamax_enguangue <- 6
      metas <- metas + " | ENGUANGUE "
      metas <- metas + numpcarac(meta_enguangue)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_enguangue)
      metamax_abislapia <- 5
      metas <- metas + " | ABISLAPIA "
      metas <- metas + numpcarac(meta_abislapia)
      metas <- metas + ("/")
      metas <- metas + numpcarac(metamax_abislapia)
      metas <- metas + (" )")

      se (meta_tipalinha >= metamax_tipalinha) e (meta_pirocha >= metamax_pirocha) e (meta_vamlula >= metamax_vamlula) e (meta_enguangue >= metamax_enguangue) e (meta_abislapia >= metamax_abislapia) entao
          meta_atual <- meta_atual + 1
          meta_tipalinha <- 0
          meta_pirocha <- 0
          meta_vamlula <- 0
          meta_enguangue <- 0
          meta_abislapia <- 0

          q_total <- q_total + 1
      fimse
   fimse
   
   se (meta_atual > 10) entao
      metas <- "( PARABÉNS, VOCÊ CONCLUIU TODAS AS METAS, AGORA APENAS SE DIVIRTA ENQUANTO QUISER ou saia apertando esc")
   fimse
fimprocedimento

procedimento pesca_anzol
var
   pX, pY: inteiro
inicio
   pX <- 11
   pY <- 0
   local_peixes[pX,pY] <- "ANZOL"
   
   resultado_pesca <- ""
   fisgado <- ""

   repita
      atualiza_lago
      tela_principal
      mexe_anzol(pX, pY)
   ate (resultado_pesca = "FUGIU") ou (resultado_pesca = "PEGOU")
   fim_pesca
fimprocedimento

procedimento mexe_anzol(var X, Y: inteiro)
var
   z, c: inteiro
   pode_subir_ou_descer: logico
inicio
   z <- -1
   pode_subir_ou_descer <- falso
   repita

      se (Y = 0) e (fisgado = "") e (pode_subir_ou_descer = falso)  entao
         acao <- "DESCER"
      fimse
      
      escreval("                                                                                      DURABILIDADE DA LINHA:",dr_linha:2,"")
      se (diagonal = falso) entao
        se (puxar_soltar = falso) entao
           se (resultado_pesca = "") e (Y < profundidade) ou (acao = "SUBIR") entao
              escreval("                                                                           < 1 > Esquerda | < 2 > Reto | < 3 > Direita ")
              pode_subir_ou_descer <- falso
            senao
              se (Y <> 0) entao
                 escreval("                       < 0 > Puxar                                         < 1 > Esquerda | < 2 > Reto | < 3 > Direita ")
                 pode_subir_ou_descer <- verdadeiro
              senao
                 escreval("                       < 0 > Soltar                                        < 1 > Esquerda | < 2 > Reto | < 3 > Direita ")
                 pode_subir_ou_descer <- verdadeiro
              fimse
           fimse
        senao
           se (acao = "DESCER") entao
              escreval("                       < 0 > Puxar                                         < 1 > Esquerda | < 2 > Reto | < 3 > Direita ")
              pode_subir_ou_descer <- verdadeiro
           senao
              escreval("                       < 0 > Soltar                                        < 1 > Esquerda | < 2 > Reto | < 3 > Direita ")
              pode_subir_ou_descer <- verdadeiro
           fimse
        fimse
      senao //diagonal = verdadeiro
        se (puxar_soltar = falso) entao
           se (resultado_pesca = "") e (Y < profundidade) ou (acao = "SUBIR") entao
              escreval("                                                      < 4 > Diagonal Esq | < 1 > Esquerda | < 2 > Reto | < 3 > Direita | < 6 > Diagonal Dir")
              pode_subir_ou_descer <- falso
           senao
              se (Y <> 0) entao
                 escreval("                       < 0 > Puxar                    < 4 > Diagonal Esq | < 1 > Esquerda | < 2 > Reto | < 3 > Direita | < 6 > Diagonal Dir")
                 pode_subir_ou_descer <- verdadeiro
              senao
                 escreval("                       < 0 > Soltar                   < 4 > Diagonal Esq | < 1 > Esquerda | < 2 > Reto | < 3 > Direita | < 6 > Diagonal Dir")
                 pode_subir_ou_descer <- verdadeiro
              fimse
           fimse
        senao
           se (acao = "DESCER") entao
              escreval("                       < 0 > Puxar                    < 4 > Diagonal Esq | < 1 > Esquerda | < 2 > Reto | < 3 > Direita | < 6 > Diagonal Dir")
              pode_subir_ou_descer <- verdadeiro
           senao
              escreval("                       < 0 > Soltar                   < 4 > Diagonal Esq | < 1 > Esquerda | < 2 > Reto | < 3 > Direita | < 6 > Diagonal Dir")
              pode_subir_ou_descer <- verdadeiro
           fimse
        fimse
      fimse
      escreval
      escreva("                                                                            D I G I T E   A Q U I   S U A   O P Ç Ã O: ")
      leia(op)
      se (diagonal = falso) entao
         escolha op
            caso "0"
               se (pode_subir_ou_descer = verdadeiro) entao
                  se (acao = "SUBIR")  entao
                     local_peixes[X,Y] <- ""
                     acao <- "DESCER"
                  senao
                     se (acao = "DESCER")  entao
                        local_peixes[X,Y] <- ""
                        acao <- "SUBIR"
                     senao
                        op <- "X"
                     fimse
                  fimse
               senao
                  op <- "X"
               fimse
            caso "1"
               local_peixes[X,Y] <- ""
               X <- X - 1
               se (X < 0) entao
                  X <- 0
               fimse
            caso "2"
               local_peixes[X,Y] <- ""
            caso "3"
               local_peixes[X,Y] <- ""
               X <- X + 1
               se (X > 11) entao
                  X <- 11
               fimse
            outrocaso
               op <- "X"
         fimescolha
      senao
         escolha op
            caso "0"
               se (pode_subir_ou_descer = verdadeiro) entao
                  se (acao = "SUBIR")  entao
                     local_peixes[X,Y] <- ""
                     acao <- "DESCER"
                  senao
                     se (acao = "DESCER")  entao
                        local_peixes[X,Y] <- ""
                        acao <- "SUBIR"
                     senao
                        op <- "X"
                     fimse
                  fimse
               senao
                  op <- "X"
               fimse
            caso "1"
               local_peixes[X,Y] <- ""
               X <- X - 1
               se (X < 0) entao
                  X <- 0
               fimse
            caso "2"
               local_peixes[X,Y] <- ""
            caso "3"
               local_peixes[X,Y] <- ""
               X <- X + 1
               se (X > 11) entao
                  X <- 11
               fimse
            caso "4"
               se (acao = "DESCER")  entao
                  local_peixes[X,Y] <- ""
                  X <- X - 1
                  se (X < 0) entao
                     X <- 0
                  fimse
                  Y <- Y + 1
                  se (Y > profundidade) entao
                     Y <- Y - 1
                  fimse
               senao
                  local_peixes[X,Y] <- ""
                  X <- X - 1
                  se (X < 0) entao
                     X <- 0
                  fimse
                  Y <- Y - 1
                  se (Y < 0) entao
                     Y <- Y + 1
                  fimse
               fimse
            caso "6"
               se (acao = "DESCER")  entao
                  local_peixes[X,Y] <- ""
                  X <- X + 1
                  se (X > 11) entao
                     X <- 11
                  fimse
                  Y <- Y + 1
                  se (Y > profundidade) entao
                     Y <- Y - 1
                  fimse
               senao
                  local_peixes[X,Y] <- ""
                  X <- X + 1
                  se (X > 11) entao
                     X <- 11
                  fimse
                  Y <- Y - 1
                  se (Y < 0) entao
                     Y <- Y + 1
                  fimse
               fimse

            outrocaso
               op <- "X"
         fimescolha
      fimse
   ate (op = "0") ou (op = "1") ou (op = "2") ou (op = "3") ou (op = "4") ou (op = "6")
   
   se (acao = "DESCER") entao
      se (Y < profundidade) entao
         Y <- Y + 1
      fimse
   senao
      se (Y > 0) entao
         Y <- Y - 1
      fimse
   fimse
   
   se (local_peixes[X,Y] <> "") entao
      se (resultado_pesca = "") entao
         resultado_pesca <- "FISGOU"
         fisgado <- local_peixes[X,Y]
      fimse
      
      repita
         z <- z + 1
         se (mexer_peixes_nome[z] <> "") entao
            se (local_peixes[mexer_peixes_posiX[z],mexer_peixes_posiY[z]] = fisgado) entao
                se (mexer_peixes_posiX[z] = X) e (mexer_peixes_posiY[z] = Y) entao
                   mexer_peixes_nome[z] <- ""
                fimse
            fimse
         fimse

      ate (mexer_peixes_posiX[z] = X) e (mexer_peixes_posiY[z] = Y)

      para c de z ate 19 faca
         mexer_peixes_nome[c] <- mexer_peixes_nome[c+1]
         mexer_peixes_posiX[c] <- mexer_peixes_posiX[c+1]
         mexer_peixes_posiY[c] <- mexer_peixes_posiY[c+1]
      fimpara
      
      dr_linha <- dr_linha - 1
      
      //mexer_peixes_nome[z] <- local_peixes[x,y]
      //mexer_peixes_posiX[z] <- x
      //mexer_peixes_posiY[z] <- y

   fimse


   local_peixes[X,Y] <- "ANZOL"
   
   se (dr_linha = 0) entao
      fisgado <- ""
      resultado_pesca <- "FUGIU"
      local_peixes[X,Y] <- ""
   fimse
   
   se (local_peixes[11,0] = "ANZOL") e (fisgado = "") entao
      resultado_pesca <- "FUGIU"
      local_peixes[X,Y] <- ""
   fimse
   
   se (local_peixes[11,0] = "ANZOL") e (fisgado <> "") entao
      resultado_pesca <- "PEGOU"
      local_peixes[X,Y] <- ""
   fimse
   
fimprocedimento

procedimento pesca_arpao
var
   pX, pY, troca_arpao: inteiro
   op: caracter
inicio
   repita
      escreval
      escreva("                                                                               D I G I T E   O N D E   L A N Ç A R: ")
      leia(op)
      
   ate (op = "1") ou (op = "01") ou (op = "2") ou (op = "02") ou (op = "3") ou (op = "03") ou (op = "4") ou (op = "04") ou (op = "5") ou (op = "05") ou (op = "6") ou (op = "06") ou (op = "7") ou (op = "07") ou (op = "8") ou (op = "08") ou (op = "9") ou (op = "09") ou (op = "10") ou (op = "11") ou (op = "12")
   
   pY <- 0
   pX <- caracpnum(op) - 1
   
   local_peixes[pX,pY] <- "ARPAO"

   resultado_pesca <- ""
   fisgados_arpao[0] <- ""
   fisgados_arpao[1] <- ""
   fisgados_arpao[2] <- ""
   arpao_atual <- 0
   
   acao <- "DESCER"
   
   repita
      atualiza_lago
      tela_principal
      mexe_arpao(pX, pY)
   ate (resultado_pesca = "FUGIU") ou (resultado_pesca = "PEGOU")
   troca_arpao <- 0
   repita
      fisgado <- fisgados_arpao[troca_arpao]
      fisgados_arpao[troca_arpao] <- ""
      troca_arpao <- troca_arpao + 1
      
      fim_pesca
   ate (fisgados_arpao[0] = "") e (fisgados_arpao[1] = "") e (fisgados_arpao[2] = "")
fimprocedimento

procedimento mexe_arpao(var X, Y: inteiro)
var
   z, c: inteiro

inicio

   z <- -1
   repita

      se (Y = 0) e (fisgados_arpao[0] = "")   entao
         acao <- "DESCER"
      fimse

      escreval("                                                                                      DURABILIDADE DA LINHA:",dr_linha:2,"")
      escreval("                       < 0 > Puxar                                                          < 1 > Reto  ")
      escreval
      escreva("                                                                            D I G I T E   A Q U I   S U A   O P Ç Ã O: ")
      leia(op)
      escolha op
         caso "0"
            se (acao = "DESCER")  entao
               local_peixes[X,Y] <- ""
               acao <- "SUBIR"
            senao
               op <- "X"
            fimse
         caso "1"
            local_peixes[X,Y] <- ""
         outrocaso
            op <- "X"
      fimescolha

   ate (op = "0") ou (op = "1")

   se (acao = "DESCER") entao
      se (Y < profundidade) entao
         Y <- Y + 1
      fimse
   senao
      se (Y > 0) entao
         Y <- Y - 1
      fimse
   fimse

   se (local_peixes[X,Y] <> "") entao
      se (arpao_atual < 3) entao
         resultado_pesca <- "FISGOU"
         fisgados_arpao[arpao_atual] <- local_peixes[X,Y]
         arpao_atual <- arpao_atual + 1
      fimse

      repita
         z <- z + 1
         se (mexer_peixes_nome[z] <> "") entao
            se (local_peixes[mexer_peixes_posiX[z],mexer_peixes_posiY[z]] = fisgados_arpao[arpao_atual - 1]) entao
                se (mexer_peixes_posiX[z] = X) e (mexer_peixes_posiY[z] = Y) entao
                   mexer_peixes_nome[z] <- ""
                fimse
            fimse
         fimse

      ate (mexer_peixes_posiX[z] = X) e (mexer_peixes_posiY[z] = Y)

      para c de z ate 19 faca
         mexer_peixes_nome[c] <- mexer_peixes_nome[c+1]
         mexer_peixes_posiX[c] <- mexer_peixes_posiX[c+1]
         mexer_peixes_posiY[c] <- mexer_peixes_posiY[c+1]
      fimpara

      dr_linha <- dr_linha - 1

   fimse

   local_peixes[X,Y] <- "ARPAO"

   se (dr_linha = 0) entao
      fisgado_arpao[0] <- ""
      fisgado_arpao[1] <- ""
      fisgado_arpao[2] <- ""
      resultado_pesca <- "FUGIU"
      local_peixes[X,Y] <- ""
   fimse

   se (Y = 0) e (resultado_pesca <> "FISGOU") entao
      resultado_pesca <- "FUGIU"
      local_peixes[X,Y] <- ""
   fimse

   se (Y = 0) e (resultado_pesca = "FISGOU") entao
      resultado_pesca <- "PEGOU"
      local_peixes[X,Y] <- ""
   fimse
fimprocedimento

procedimento fim_pesca
var
   qualidade, x, gan_grana: inteiro
   tamanho, peso: real
   desenho_q:caracter
inicio
   limpatela
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   
   qualidade <- qualidade_peixe(fisgado)
   desenho_q <- ""
   
   para x de 1 ate qualidade faca
       desenho_q <- desenho_q + " *$* "
   fimpara
   
   ESCOLHA fisgado
   
      caso ""
         escreval ("                                    __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __    ")
         escreval ("                                   /   __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  \  ")
         escreval ("                                  /  /                               +                                                            +                              \  \ ")
         escreval ("                                 |  |   R E S U L T A D O :          +    _ _ _ _                                                 +                               |  |")
         escreval ("                                 |  |                                +   |  _ _ _|    _ _      _         _       _      _ _       +      D E S C R I Ç Ã O :      |  |")
         escreval ("                                 |  |    Peixe Pescado: Nada         +   | |_ _ _    / _ \    | |       | |     | |    / _ \      +                               |  |")
         escreval ("                                 |  |                                +   |  _ _ _|  / / \ \   | |       | |_ _ _| |   / / \ \     +                               |  |")
         escreval ("                                 |  |    Qualidade: X                +   | |       / /_ _\ \  | |       |         |  / /_ _\ \    +                               |  |")
         escreval ("                                 |  |                                +   | |      |   _ _   | | |       |  _ _ _  | |   _ _   |   +   Não pescou nada, parabéns   |  |")
         escreval ("                                 |  |    Tamanho: X                  +   | |      |  /   \  | | |_ _ _  | |     | | |  /   \  |   +                               |  |")
         escreval ("                                 |  |                                +   |_|      |_/     \_| |_ _ _ _| |_|     |_| |_/     \_|   +                               |  |")
         escreval ("                                 |  |    Peso: X                     +                                                            +                               |  |")
         escreval ("                                 |  |                                +                                                            +                               |  |")
         escreval ("                                  \  \ __  __  __  __  __  __  __  __+ __  __  __  __  __  __  __  __  __  __  __  __  __  __  __ +__  __  __  __  __  __  __  __/  / ")
         escreval ("                                   \__  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __ /  ")
         escreval
      caso "TIPALINHA"
         tamanho <- (qualidade * 5) / (randi(3) + 1)
         peso <- (qualidade * 3) / (randi(5) + 1)
         peso <- peso * 0.1
         gan_grana <- qualidade * (randi(5) + 26)
         grana <- grana + gan_grana
         escreval ("                                    __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __    ")
         escreval ("                                   /   __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  \  ")
         escreval ("                                  /  /                               +                                                            +                              \  \ ")
         escreval ("                                 |  |   R E S U L T A D O :          +                         __                                 +                               |  |")
         escreval ("                                 |  |                                +                        /  |                                +      D E S C R I Ç Ã O :      |  |")
         escreval ("                                 |  |    Peixe Pescado: ",fisgado:13,"+                       /   /         __                     +                               |  |")
         escreval ("                                 |  |                                +                  .---´  ,-.----.   / -/                    +   Peixe de estatura pequena   |  |")
         escreval ("                                 |  |    Qualidade:",desenho_q:15,"   +                 / (O)  ´  |     `-´ --\                    +   de águas rasas, levemente   |  |")
         escreval ("                                 |  |                                +                 \.     `..|     .-. --/                    +   valioso.                    |  |")
         escreval ("                                 |  |    Tamanho: ",tamanho:2:1," Cm             +                  `---.    ,----´   \_-\                    +                               |  |")
         escreval ("                                 |  |                                +                       \   \                                +   Move-se apenas  de um lado  |  |")
         escreval ("                                 |  |    Peso: ",peso:3:1," Kg                +                        \__|                                +   para o outro.               |  |")
         escreval ("                                 |  |                                +                                                            +                               |  |")
         escreval ("                                  \  \ __  __  __  __  __  __  __  __+ __  __  __  __  __  __  __  __  __  __  __  __  __  __  __ +__  __  __  __  __  __  __  __/  / ")
         escreval ("                                   \__  __  __  __  __  __  __  __  __  __  __  __  __  __  __              __  __  __  __  __  __  __  __  __  __  __  __  __  __ /  ")
         escreval ("                                                                                                + ",gan_grana:2," GRANA")
         meta_tipalinha <- meta_tipalinha + 1
      caso "PIROCHA"
         tamanho <- (qualidade * 15) / (randi(3) + 1)
         peso <- (qualidade * 12) / (randi(5) + 1)
         peso <- peso * 0.8
         gan_grana <- qualidade * (randi(15) + 36)
         grana <- grana + gan_grana
         escreval ("                                    __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __    ")
         escreval ("                                   /   __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  \  ")
         escreval ("                                  /  /                               +                     ________                               +                              \  \ ")
         escreval ("                                 |  |   R E S U L T A D O :          +                  __/__/_/__/|___                           +                               |  |")
         escreval ("                                 |  |                                +                 /> > > > > > > >\      __/|                +      D E S C R I Ç Ã O :      |  |")
         escreval ("                                 |  |    Peixe Pescado: ",fisgado:13,"+                /> > >(@ ) > > > >\    / --/                +                               |  |")
         escreval ("                                 |  |                                +               |>,. ,. ,. ,. ,. > >\__/ -->\                +   Piranha de escamas rígidas  |  |")
         escreval ("                                 |  |    Qualidade:",desenho_q:15,"   +               |/ |/ |/ |/ |/ |> > >__ > -- >               +   de visão limitada, de modo  |  |")
         escreval ("                                 |  |                                +                              | >  /  \ -->/                +   a comumente  afastar-se de  |  |")
         escreval ("                                 |  |    Tamanho: ",tamanho:4:1," Cm            +                |\ |\ |\ |\   |> >/    \_--\                +   luminosidade.               |  |")
         escreval ("                                 |  |                                +                \ `  `  `  `-´  _/        \|                +                               |  |")
         escreval ("                                 |  |    Peso: ",peso:4:1," Kg               +                 \_____________/                            +   Move-se apenas para cima e  |  |")
         escreval ("                                 |  |                                +                    \__\_\__\|                              +   para baixo.                 |  |")
         escreval ("                                  \  \ __  __  __  __  __  __  __  __+ __  __  __  __  __  __  __  __  __  __  __  __  __  __  __ +__  __  __  __  __  __  __  __/  / ")
         escreval ("                                   \__  __  __  __  __  __  __  __  __  __  __  __  __  __  __              __  __  __  __  __  __  __  __  __  __  __  __  __  __ /  ")
         escreval ("                                                                                                + ",gan_grana:2," GRANA")
         meta_pirocha <- meta_pirocha + 1
      caso "VAMLULA"
         tamanho <- (qualidade * 160) / (randi(3) + 1)
         peso <- (qualidade * 140) / (randi(5) + 1)
         peso <- peso * 0.9
         gan_grana <- qualidade * (randi(25) + 56)
         grana <- grana + gan_grana
         escreval ("                                    __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __    ")
         escreval ("                                   /   __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  \  ")
         escreval ("                                  /  /                               +                                                            +                              \  \ ")
         escreval ("                                 |  |   R E S U L T A D O :          +                                 __________                 +                               |  |")
         escreval ("                                 |  |                                +            ___  ____________   / ~________)                +      D E S C R I Ç Ã O :      |  |")
         escreval ("                                 |  |    Peixe Pescado: ",fisgado:13,"+            \_ \/~ ~ ~ ~ ~ ~ \_/ ~/___________              +                               |  |")
         escreval ("                                 |  |                                +              \/~ ~ ~( )~ ~ ~ ~ ~_____________)             +   Lula de consideravel e bem  |  |")
         escreval ("                                 |  |    Qualidade:",desenho_q:15,"   +              |~ ~ ~ ~ ~ ~ ~ ~ ~/-´                         +   surpreendente comprimento.  |  |")
         escreval ("                                 |  |                                +              | ~ ~ ~ ~ ~ ~ ~ ~ \-,___________              +   Conhecida  por  prender-se  |  |")
         escreval ("                                 |  |    Tamanho: ",tamanho:5:1," Cm           +             _/\ ~ ~ ( ) ~ ~ ~_~ ~ ___________)             +   em baleias e  se alimentar  |  |")
         escreval ("                                 |  |                                +            /__/\_~_~_~_~_~_~/ \~ \_______                  +   do sangue da mesma.         |  |")
         escreval ("                                 |  |    Peso: ",peso:5:1," Kg              +                                \_________)                 +                               |  |")
         escreval ("                                 |  |                                +                                                            +   Move-se em 4 diagonais.     |  |")
         escreval ("                                  \  \ __  __  __  __  __  __  __  __+ __  __  __  __  __  __  __  __  __  __  __  __  __  __  __ +__  __  __  __  __  __  __  __/  / ")
         escreval ("                                   \__  __  __  __  __  __  __  __  __  __  __  __  __  __  __              __  __  __  __  __  __  __  __  __  __  __  __  __  __ /  ")
         escreval ("                                                                                                + ",gan_grana:2," GRANA")

         meta_vamlula <- meta_vamlula + 1
      caso "ENGUANGUE"
         tamanho <- (qualidade * 200) / (randi(3) + 1)
         peso <- (qualidade * 160) / (randi(5) + 1)
         peso <- peso * 1.1
         gan_grana <- qualidade * (randi(45) + 86)
         grana <- grana + gan_grana
         escreval ("                                    __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __    ")
         escreval ("                                   /   __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  \  ")
         escreval ("                                  /  /                               +                    /| / / / /  /  /   / \                  +                              \  \ ")
         escreval ("                                 |  |   R E S U L T A D O :          +                    \ .-----------------. /\                +                               |  |")
         escreval ("                                 |  |                                +            /|       / __                \  \               +      D E S C R I Ç Ã O :      |  |")
         escreval ("                                 |  |    Peixe Pescado: ",fisgado:13,"+           / |      | /O/ ,.   _____      \ _\              +                               |  |")
         escreval ("                                 |  |                                +          |  \      \____/ |  |     |      | |              +   Enguia rara  com um grande  |  |")
         escreval ("                                 |  |    Qualidade:",desenho_q:15,"   +          |   \        ____/ /      |      | |              +   valor de negócios.          |  |")
         escreval ("                                 |  |                                +           \   \       `----´       /      | |              +   Comumente é  usada  de pet  |  |")
         escreval ("                                 |  |    Tamanho: ",tamanho:5:1," Cm           +            \   \                  /      /__|              +   por aqueles  que  buscam o  |  |")
         escreval ("                                 |  |                                +             \   `._______________/      /  /               +   ápice de status social.     |  |")
         escreval ("                                 |  |    Peso: ",peso:5:1," Kg              +              \                         /  /                +                               |  |")
         escreval ("                                 |  |                                +               \_______________________/ \/                 +   Move-se em 4 n/ diagonais.  |  |")
         escreval ("                                  \  \ __  __  __  __  __  __  __  __+ __  __  __  __  __  __  __  __  __  __  __  __  __  __  __ +__  __  __  __  __  __  __  __/  / ")
         escreval ("                                   \__  __  __  __  __  __  __  __  __  __  __  __  __  __  __              __  __  __  __  __  __  __  __  __  __  __  __  __  __ /  ")
         escreval ("                                                                                                + ",gan_grana:2," GRANA")
         meta_enguangue <- meta_enguangue + 1
      caso "ABISLAPIA"
         tamanho <- (qualidade * 300) / (randi(3) + 1)
         peso <- (qualidade * 260) / (randi(5) + 1)
         peso <- peso * 1.2
         gan_grana <- qualidade * (randi(65) + 106)
         grana <- grana + gan_grana
         escreval ("                                    __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __    ")
         escreval ("                                   /   __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  \  ")
         escreval ("                                  /  /                               +                                       ______               +                              \  \ ")
         escreval ("                                 |  |   R E S U L T A D O :          +                       _______________/$  __/               +                               |  |")
         escreval ("                                 |  |                                +                      /$        $        /                  +      D E S C R I Ç Ã O :      |  |")
         escreval ("                                 |  |    Peixe Pescado: ",fisgado:13,"+                   .-----------------.  /                   +                               |  |")
         escreval ("                                 |  |                                +                  /  <o> <O>          \/    ___________     +   Peixe de estatura anormal.  |  |")
         escreval ("                                 |  |    Qualidade:",desenho_q:15,"   +                _/  <C> <@> ----.   $  \___/ $       _/     +   Incrivelmente  valioso por  |  |")
         escreval ("                                 |  |                                +               (_  <0> <Q>    $ |                $ _/       +   seu sabor agrídoce em seus  |  |")
         escreval ("                                 |  |    Tamanho: ",tamanho:5:1," Cm           +               (^^          ----´$      ___   $   /         +   olhos. Um prato finíssimo.  |  |")
         escreval ("                                 |  |                                +                \  $     $             /   \______\         +                               |  |")
         escreval ("                                 |  |    Peso: ",peso:5:1," Kg              +                 `----.---------.-----´                     +   Move-se de um lado para o   |  |")
         escreval ("                                 |  |                                +                       `---------`                          +   outro 2 por vez.            |  |")
         escreval ("                                  \  \ __  __  __  __  __  __  __  __+ __  __  __  __  __  __  __  __  __  __  __  __  __  __  __ +__  __  __  __  __  __  __  __/  / ")
         escreval ("                                   \__  __  __  __  __  __  __  __  __  __  __  __  __  __  __              __  __  __  __  __  __  __  __  __  __  __  __  __  __ /  ")
         escreval ("                                                                                                + ",gan_grana:2," GRANA")
         meta_abislapia <- meta_abislapia + 1
   FIMESCOLHA
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreva("                                                                            D I G I T E   E N T E R   P A R A   R E T O R N A R                                                                                                                                                                                         ")
   leia(op)
   para x de 0 ate 20 faca
       mexer_peixes_nome[x] <- ""
      mexer_peixes_posiX[x] <- -1
      mexer_peixes_posiY[x] <- -1
   fimpara
   preenche_lago
fimprocedimento

funcao qualidade_peixe(peixe:caracter):inteiro
var
   chance: inteiro
inicio
   escolha peixe
     caso "TIPALINHA"
         chance <- randi(50)+1
     caso "PIROCHA"
         chance <- randi(40)+1
     caso "VAMLULA"
         chance <- randi(30)+1
     caso "ENGUANGUE"
         chance <- randi(20)+1
     caso "ABISLAPIA"
         chance <- randi(10)+1
   fimescolha
   
   chance <- chance + dr_linha * 10
   chance <- chance + bonus_q
   
   se(q_total = 0) entao
      chance <- chance + 10
   fimse
   
   se(chance <= 60) entao
      retorne 1
   senao
      se(chance <= 90) entao
         retorne 2
      senao
         retorne 3
      fimse
   fimse
fimfuncao

procedimento aprimoramentos
var
   apresentar_grana, op, index: caracter
   x, y: inteiro
   comprou: logico
   precos:vetor[0..5] de inteiro
   avancado:vetor[0..1] de caracter
inicio

   repita
      comprou <- falso
      
      precos[0] <- 5
      precos[1] <- 10
      precos[2] <- 15
      precos[3] <- 300
      precos[4] <- 300
      precos[5] <- 40
      
      se (diagonal = falso) entao
          avancado[0] <- "      NÃO  ADQUIRIDO      "
      senao
          avancado[0] <- "         ADQUIRIDO        "
      fimse
      
      se (puxar_soltar = falso) entao
          avancado[1] <- "      NÃO  ADQUIRIDO      "
      senao
          avancado[1] <- "         ADQUIRIDO        "
      fimse
      
      para x de 1 ate melhorias[0] faca
          se (x < 5) entao
             precos[0] <- precos[0] * 3
          fimse
      fimpara

      para x de 1 ate melhorias[1] faca
          se (x < 4) entao
             precos[1] <- precos[1] * 4
          fimse
      fimpara
      
      para x de 1 ate melhorias[2] faca
          se (x < 8) entao
             precos[2] <- precos[2] * 2
          fimse
      fimpara
      
      apresentar_grana <- "GRANA: "
      apresentar_grana <- apresentar_grana + numpcarac(grana)
      limpatela
      
      escreval ("                                    .-----------------------------------------------------------------------------------------------------------------------------.   ")
      escreval ("                                    | .-------------------------------------------------------------------------------------------------------------------------. |   ")
      escreval ("                                    | | META ATUAL: ",metas: 95,"             | |   ")
      escreval ("                                    | |------------------------+--------------------------+--------------------------+-------------------------+----------------+ |   ")
      escreval ("                                    | |                        |                          |                          |  Toda compra realizada  | ",apresentar_grana:14," | |   ")
      escreval ("                                    | |                        | Vara Equipada: ",tipo_pesca:5,"     |  Configuração Avançada:  |  é permanente.          +----------------+ |   ")
      escreval ("                                    | | < X > APRIMORAMENTOS   |                          |                          |                                          | |   ")
      escreval ("                                    | |                        | Durabilidade Total: ",dr_linha_total:1,"    |  Movimentação Aumentada  |     Cada compra  aumenta o valor das     | |   ")
      escreval ("                                    | |                        |                          |",avancado[0]:26,"|     compras  posteriores  do  mesmo.     | |   ")
      escreval ("                                    | |                        | Profundidade Lago: ",profundidade+1:2,"    |                          |                                          | |   ")
      escreval ("                                    | | < 0 > Retornar ao Lago |                          | Controle de Profundidade |     Se o nível for Único, então pode     | |   ")
      escreval ("                                    | |                        | Bônus de Qualidade: ",bonus_q:2,"%  |",avancado[1]:26,"|     comprar somente uma vez.             | |   ")
      escreval ("                                    | |                        |                          |                          |                                          | |   ")
      escreval ("                                    |_|______.________.________.________.________.________.________.________.________.________.________.________.________.______|_|   ")
      
      escreval
      se (melhorias[0] < 5) então
         index <- "1"
      senao
         index <- "X"
      fimse
      escreval
      escreval ("                                    | COMPRAR /  Preço:  ||     A U M E N T A R     || Nível: || Durabilidade da || Permite entrar em contato com mais  \ COMPRAR |   ")
      escreval ("                                    |  < ",index:1," >  \   ",precos[0]:4,"   || D U R A B I L I D A D E ||   0",melhorias[0]:1,"   ||     Linha +1    || peixes sem risco de fugir           /  < ",index:1," >  |   ")
      escreval
      se (melhorias[1] < 4) então
         index <- "2"
      senao
         index <- "X"
      fimse
      escreval
      escreval ("                                    | COMPRAR /  Preço:  ||     A U M E N T A R     || Nível: || Profundidade do || Permite encontrar mais peixes raros \ COMPRAR |   ")
      escreval ("                                    |  < ",index:1," >  \   ",precos[1]:4,"   || P R O F U N D I D A D E ||   0",melhorias[1]:1,"   ||     Lago +2     || ao ir mais fundo no lago            /  < ",index:1," >  |   ")
      escreval
      se (melhorias[2] < 8) então
         index <- "3"
      senao
         index <- "X"
      fimse
      escreval
      escreval ("                                    | COMPRAR /  Preço:  ||     A U M E N T A R     || Nível: || Porcentagem  de || Chance aumentada de qualidade maior \ COMPRAR |   ")
      escreval ("                                    |  < ",index:1," >  \   ",precos[2]:4,"   ||    Q U A L I D A D E    ||   0",melhorias[2]:1,"   ||  Qualidade +5%  || dos peixes pescados                 /  < ",index:1," >  |   ")
      escreval
      se (diagonal = falso) então
         index <- "4"
      senao
         index <- "X"
      fimse
      escreval
      escreval ("                                    | COMPRAR /  Preço:  || M O V I M E N T A Ç Ã O || Nível: || Anzol poderá se || Ao pescar com o Anzol, passa a ser  \ COMPRAR |   ")
      escreval ("                                    |  < ",index:1," >  \   ",precos[3]:4,"   ||    A U M E N T A D A    || ÚNICO  ||mover +4 direções|| possível move-lo +1 na diagonal     /  < ",index:1," >  |   ")
      escreval
      se (puxar_soltar = falso) então
         index <- "5"
      senao
         index <- "X"
      fimse
      escreval
      escreval ("                                    | COMPRAR /  Preço:  ||  C O N T R O L E   D E  || Nível: ||   Puxar/Soltar  || Ao pescar com o Anzol,  irá  poder  \ COMPRAR |   ")
      escreval ("                                    |  < ",index:1," >  \   ",precos[4]:4,"   || P R O F U N D I D A D E || ÚNICO  || Anzol à escolha || puxar e soltar à qualquer momento   /  < ",index:1," >  |   ")
      escreval

      //escreval
      //escreval ("                                    | COMPRAR /  Preço:  || X X X X X X X X X X X X || Nível: || Ganho           || Descrição                           \ COMPRAR |   ")
      //escreval ("                                    |  < x >  \   XXXX   || X X X X X X X X X X X X ||   0X   ||                 ||                                     /  < X >  |   ")
      //escreval
      
      escreval
      escreval
      escreva("                                                                            D I G I T E   A Q U I   S U A   O P Ç Ã O: ")
      leia(op)

      escolha op
         caso "1"
            se (grana >= precos[0]) e (melhorias[0] < 5) entao
               grana <- grana - precos[0]
               dr_linha_total <- dr_linha_total + 1
               melhorias[0] <- melhorias[0] + 1
            senao
               op <- "X"
            fimse
         caso "2"
            se (grana >= precos[1]) e (melhorias[1] < 4) entao
               grana <- grana - precos[1]
               profundidade <- profundidade + 2
               melhorias[1] <- melhorias[1] + 1
            senao
               op <- "X"
            fimse
         caso "3"
            se (grana >= precos[2]) e (melhorias[2] < 8) entao
               grana <- grana - precos[2]
               bonus_q <- bonus_q + 5
               melhorias[2] <- melhorias[2] + 1
            senao
               op <- "X"
            fimse
         caso "4"
            se (grana >= precos[3]) e (diagonal = falso) entao
               grana <- grana - precos[3]
               diagonal <- verdadeiro
            senao
               op <- "X"
            fimse
         caso "5"
            se (grana >= precos[4]) e (puxar_soltar = falso) entao
               grana <- grana - precos[4]
               puxar_soltar <- verdadeiro
            senao
               op <- "X"
            fimse
      fimescolha
   ate (op = "0")
fimprocedimento

procedimento modificar_lago
var
   apresentar_grana, op, peixe, index: caracter
   x, y: inteiro
   disponivel: vetor[1..5] de logico
   
   oper_char: caracter
    oper_int: inteiro

inicio
   
   para x de 1 ate 5 faca
      disponivel[X] <- falso
   fimpara
   
   repita
      limpatela

      escreval ("                                    .-----------------------------------------------------------------------------------------------------------------------------.   ")
      escreval ("                                    | .-------------------------------------------------------------------------------------------------------------------------. |   ")
      escreval ("                                    | | META ATUAL: ",metas: 95,"             | |   ")
      escreval ("                                    | |------------------------+-----------------+-----------------+-----------------+------------------------------------------| |   ")
      escreval ("                                    | |                        |     Peixes      |   Quantidades   |   Chances  de   |                                          | |   ")
      escreval ("                                    | |                        |  Desbloqueados  |     Atuais:     |     Surgir:     |      Se as  Quantidades Disponíveis      | |   ")
      escreval ("                                    | | < X > MODIFICAR LAGO   +-----------------+-----------------+-----------------+      forem  totalmente  usadas,  há      | |   ")
      escreval ("                                    | |                        |      TIPALINHA: |       ",q_tipalinha+q_tipalinha_b:2,"        |       ",chance_tipalinha+chance_tipalinha_b:2,"        |      chance de +20% na qualidade de      | |   ")
      se(meta_atual > 1) entao
         escreval ("                                    | |                        |        PIROCHA: |       ",q_pirocha+q_pirocha_b:2,"        |       ",chance_pirocha+chance_pirocha_b:2,"        |      quaisquer peixe pescado.            | |   ")
      senao
         escreval ("                                    | |                        |                 |                 |                 |      quaisquer peixe pescado.            | |   ")
      fimse
      se(meta_atual > 3) entao
         escreval ("                                    | |                        |        VAMLULA: |       ",q_vamlula+q_vamlula_b:2,"        |       ",chance_vamlula+chance_vamlula_b:2,"        |                                          | |   ")
      senao
         escreval ("                                    | |                        |                 |                 |                 |                                          | |   ")
      fimse
      se(meta_atual > 5) entao
         escreval ("                                    | | < 0 > Retornar ao Lago |      ENGUANGUE: |       ",q_enguangue+q_enguangue_b:2,"        |       ",chance_enguangue+chance_enguangue_b:2,"        |      Maiores Chances de Surgir pode      | |   ")
      senao
         escreval ("                                    | | < 0 > Retornar ao Lago |                 |                 |                 |      Maiores Chances de Surgir pode      | |   ")
      fimse
      se(meta_atual > 7) entao
         escreval ("                                    | |                        |      ABISLAPIA: |       ",q_abislapia+q_abislapia_b:2,"        |       ",chance_abislapia+chance_abislapia_b:2,"        |      ocasionar no peixe nascer mais      | |   ")
      senao
         escreval ("                                    | |                        |                 |                 |                 |      ocasionar no peixe nascer mais      | |   ")
      fimse
      escreval ("                                    | |                        |                 |                 |                 |      à esquerda.                         | |   ")
      escreval ("                                    |_|______.________.________.________.________.________.________.________.________.________.________.________.________.______|_|   ")
      escreval

      escreval
      escreval ("                                    |  OPÇÃO  /      A L T E R A R      || Disponível: ||          Acrescentar as quantias possíveis de surgir          \  OPÇÃO  |   ")
      escreval ("                                    |  < 1 >  \  Q U A N T I D A D E S  ||     ",q_total:2,"      ||         determinados peixes no espaço atual do lago.          /  < 1 >  |   ")
      escreval
      //",q_disponivel:2,"
      escreval
      escreval ("                                    |  OPÇÃO  /      A L T E R A R      || Disponível: ||            Acrescentar as possibilidades de surgir            \  OPÇÃO  |   ")
      escreval ("                                    |  < 2 >  \      C H A N C E S      ||     ",chances:3,"     ||         determinados peixes no espaço atual do lago.          /  < 2 >  |   ")
      escreval
      //",c_disponivel:3,"
      escreval
      escreval ("                                    |  OPÇÃO  /      R E S E T A R      || Disponível: ||           Resetar quantidades e chances ao possível           \  OPÇÃO  |   ")
      escreval ("                                    |  < 3 >  \ M O D I F I C A Ç Õ E S ||   SEMPRE    ||                 mantendo o mínimo obrigatório                 /  < 3 >  |   ")
      escreval
      ////////
      escreval
      escreval
      escreva("                                                                            D I G I T E   A Q U I   S U A   O P Ç Ã O: ")
      leia(op)
      se (op = "3") entao
         q_total <- q_total + q_tipalinha_b
         q_total <- q_total + q_pirocha_b
         q_total <- q_total + q_vamlula_b
         q_total <- q_total + q_enguangue_b
         q_total <- q_total + q_abislapia_b

         q_tipalinha_b <- 0
         q_pirocha_b <- 0
         q_vamlula_b <- 0
         q_enguangue_b <- 0
         q_abislapia_b <- 0

         chances <- chances + chance_tipalinha_b
         chances <- chances + chance_pirocha_b
         chances <- chances + chance_vamlula_b
         chances <- chances + chance_enguangue_b
         chances <- chances + chance_abislapia_b

         chance_tipalinha_b <- 0
         chance_pirocha_b <- 0
         chance_vamlula_b <- 0
         chance_enguangue_b <- 0
         chance_abislapia_b <- 0
      fimse
      se (op <> "0") e (op <> "3") entao
         escreval
         escreval ("                                    ==============================================================================================================================")
         escreval
         escreval ("                                                                                    Q U A L   A L T E R A R ? ")
         escreval
         escreva  ("                                                               |")
         escreva  ("  TIPALINHA  |")
         disponivel[1] <- verdadeiro
         se (meta_atual > 1) entao
         escreva  ("   PIROCHA   |")
         disponivel[2] <- verdadeiro
         senao
         escreva  (" XXXXXXXXXXX |")
         fimse
         se (meta_atual > 3) entao
         escreva  ("   VAMLULA   |")
         disponivel[3] <- verdadeiro
         senao
         escreva  (" XXXXXXXXXXX |")
         fimse
         se (meta_atual > 5) entao
         disponivel[4] <- verdadeiro
         escreva  ("  ENGUANGUE  |")
         senao
         escreva  (" XXXXXXXXXXX |")
         fimse
         se (meta_atual > 7) entao
         escreva  ("  ABISLAPIA  |")
         disponivel[5] <- verdadeiro
         senao
         escreva  (" XXXXXXXXXXX |")
         fimse

         escreval
         escreva  ("                                                               |")
         escreva  ("    < 1 >    |")
         se (meta_atual > 1) entao
         escreva  ("    < 2 >    |")
         senao
         escreva  ("    < X >    |")
         fimse
         se (meta_atual > 3) entao
         escreva  ("    < 3 >    |")
         senao
         escreva  ("    < X >    |")
         fimse
         se (meta_atual > 5) entao
         escreva  ("    < 4 >    |")
         senao
         escreva  ("    < X >    |")
         fimse
         se (meta_atual > 7) entao
         escreva  ("    < 5 >    |")
         senao
         escreva  ("    < X >    |")
         fimse

         escreval
         escreval
         escreval
         escreva("                                                                            D I G I T E   A Q U I   S U A   O P Ç Ã O: ")
         leia(peixe)
         se (peixe = "1") ou (peixe = "2") ou (peixe = "3") ou (peixe = "4") ou (peixe = "5") entao
             y <- caracpnum(peixe)
            se (disponivel[y] = falso) entao
               y <- 0
            senao
               escreval
               escreval ("                                    ==============================================================================================================================")
               escreval
               escreval ("                                                                                 Q U A L   A   O P E R A Ç Ã O ?")

               escolha op
                  caso "1"
                     escreval
                     escreval ("                                                                                 < 1 > +1 | < 2 > +2 | < 3 > +3 ")
                     escreval
                     escreval
                     escreva("                                                                            D I G I T E   A Q U I   S U A   O P Ç Ã O: ")
                     leia(oper_char)
                     se (oper_char = "1") ou (oper_char = "2") ou (oper_char = "3") entao
                        oper_int <- caracpnum(oper_char)
                        
                        se (oper_int <= q_total) entao
                           escolha y
                              caso 1
                                 se (q_tipalinha_b + oper_int <= 3) entao
                                    q_tipalinha_b  <- q_tipalinha_b + oper_int
                                    q_total <- q_total - oper_int
                                 fimse
                              caso 2
                                 se (q_pirocha_b + oper_int <= 3) entao
                                    q_pirocha_b  <- q_pirocha_b + oper_int
                                    q_total <- q_total - oper_int
                                 fimse
                              caso 3
                                 se (q_vamlula_b + oper_int <= 3) entao
                                    q_vamlula_b  <- q_vamlula_b + oper_int
                                    q_total <- q_total - oper_int
                                 fimse
                              caso 4
                                 se (q_enguangue_b + oper_int <= 3) entao
                                    q_enguangue_b  <- q_enguangue_b + oper_int
                                    q_total <- q_total - oper_int
                                 fimse
                              caso 5
                                 se (q_abislapia_b + oper_int <= 3) entao
                                    q_abislapia_b  <- q_abislapia_b + oper_int
                                    q_total <- q_total - oper_int
                                 fimse
                           fimescolha
                        fimse
                     fimse
                  caso "2"
                     escreval
                     escreval ("                                                                                < 1 > +10 | < 2 > +20 | < 3 > +30")
                     escreval
                     escreval
                     escreva("                                                                            D I G I T E   A Q U I   S U A   O P Ç Ã O: ")
                     leia(oper_char)
                     se (oper_char = "1") ou (oper_char = "2") ou (oper_char = "3") entao
                        oper_int <- caracpnum(oper_char)
                        oper_int <- oper_int * 10
                        se (oper_int <= chances) entao
                           escolha y
                              caso 1
                                 se (chance_tipalinha_b + oper_int <= 30) entao
                                    chance_tipalinha_b  <- chance_tipalinha_b + oper_int
                                    chances <- chances - oper_int
                                 fimse
                              caso 2
                                 se (chance_pirocha_b + oper_int <= 30) entao
                                    chance_pirocha_b  <- chance_pirocha_b + oper_int
                                    chances <- chances - oper_int
                                 fimse
                              caso 3
                                 se (chance_vamlula_b + oper_int <= 30) entao
                                    chance_vamlula_b  <- chance_vamlula_b + oper_int
                                    chances <- chances - oper_int
                                 fimse
                              caso 4
                                 se (chance_enguangue_b + oper_int <= 30) entao
                                    chance_enguangue_b  <- chance_enguangue_b + oper_int
                                    chances <- chances - oper_int
                                 fimse
                              caso 5
                                 se (chance_abislapia_b + oper_int <= 30) entao
                                    chance_abislapia_b  <- chance_abislapia_b + oper_int
                                    chances <- chances - oper_int
                                 fimse
                           fimescolha
                        fimse
                     fimse
               fimescolha
            fimse
         fimse
      fimse
   ate (op = "0")
fimprocedimento

procedimento tela_principal
var
   apresentar_grana: caracter
inicio
   apresentar_grana <- "GRANA: "
   apresentar_grana <- apresentar_grana + numpcarac(grana)
   limpatela
   se (tipo_pesca = "ANZOL") entao
      escreval ("                                    .-----------------------------------------------------------------------------------------------------------------------------.   ")
      escreval ("                                    | .-------------------------------------------------------------------------------------------------------------------------. |   ")
      escreval ("                                    | | META ATUAL: ",metas: 105,"   | |   ")
      escreval ("                                    | |------------------------+-------------------------------------------------------------------------------+----------------+ |   ")
      escreval ("                                    | |                        |                                                                               | ",apresentar_grana:14," | |   ")
      escreval ("                                    | | < 1 > APRIMORAMENTOS   |                      ____________________________________                     +----------------+ |   ")
      escreval ("                                    | |                        |                     |########/         _     /###########|                                     | |   ")
      escreval ("                                    | | < 2 > MODIFICAR LAGO   |                     |#######/         /_\   /############|                                     | |   ")
      escreval ("                                    | |                        |                     |######/         (v.v) /#############|                                     | |   ")
      se (meta_atual > 5) entao
      escreval ("                                    | | < 3 > TROCAR O ANZOL   |                     |#####____________/ \__##############|                                     | |   ")
      senao
      escreval ("                                    | | < X > TROCAR O ANZOL   |                     |#####____________/ \__##############|                                     | |   ")
      fimse
      escreval ("                                    | |                        |                                                                                                | |   ")
      escreval ("                                    | | < 4 > Atualizar Lago   |                                                                               < 5 > LANÇAR     | |   ")
      escreval ("                                    | |                        |                                                                                                | |   ")
      escreval ("                                  __|_|______.________.________.________.________.________.________.________.________.________.________.________|___  ___|______|_|__ ")
      escreval ("                                 ||||                                                                                                               \/            ||||")
   senao
      escreval ("                                    .-----------------------------------------------------------------------------------------------------------------------------.   ")
      escreval ("                                    | .-------------------------------------------------------------------------------------------------------------------------. |   ")
      escreval ("                                    | | META ATUAL: ",metas: 105,"   | |   ")
      escreval ("                                    | |------------------------+-------------------------------------------------------------------------------+----------------+ |   ")
      escreval ("                                    | |                        |                                                                               | ",apresentar_grana:14," | |   ")
      escreval ("                                    | | < 1 > APRIMORAMENTOS   |                      ____________________________________                     +----------------+ |   ")
      escreval ("                                    | |                        |                     |########/         _     /###########|                                     | |   ")
      escreval ("                                    | | < 2 > MODIFICAR LAGO   |                     |#######/         /_\   /############|                                     | |   ")
      escreval ("                                    | |                        |                     |######/         (v.v) /#############|                                     | |   ")
      escreval ("                                    | | < 3 > TROCAR O ARPÃO   |                     |#####____________/ \__##############|                                     | |   ")
      escreval ("                                    | |                        |                                                                                                | |   ")
      escreval ("                                    | | < 4 > Atualizar Lago   |                                                                               < 5 > LANÇAR     | |   ")
      escreval ("                                    | |                        |                                                                                                | |   ")
      escreval ("                                  __|_|______.___01___.___02___.___03___.___04___.___05___.___06___.___07___.___08___.___09___.___10___.___11___.___12___.______|_|__ ")
      escreval ("                                 ||||            \/       \/       \/       \/       \/       \/       \/       \/       \/       \/       \/       \/            ||||")
   fimse

   apresenta_lago
fimprocedimento

procedimento tela_inicial
var
   op: caracter
inicio
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval ("                                    __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __    ")
   escreval ("                                   /   __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  \  ")
   escreval ("                                  /  /                                                                                                                           \  \ ")
   escreval ("                                 |  |      _______                                     _                 ________                                                 |  |")
   escreval ("                                 |  |     / _____ \                                   | \               |  ______|                                                |  |")
   escreval ("                                 |  |    / /     \ \                                   \ |              | |                                                       |  |")
   escreval ("                                 |  |   | |       |_|   ___    ____     ___     ____   |/  ____         | |_____   _    ____    _    _   _   __    _    _____     |  |")
   escreval ("                                 |  |   | |            / _ \  |  _ \   / _ \   / __ \     / ___\        |  _____| |_|  / ___\  | |  | | |_| |  \  | |  / ____\    |  |")
   escreval ("                                 |  |   | |        _  / / \ \ | |_\ | / / \ \ | /  \_|   | |___         | |        _  | |___   | |__| |  _  |   \ | | | /  ___    |  |")
   escreval ("                                 |  |   | |       | | | |_| | |  _  / | |_| | | |   _     \___ \        | |       | |  \___ \  |  __  | | | | |\ \| | | | |__ |   |  |")
   escreval ("                                 |  |    \ \_____/ /  |  _  | | | \ \ |  _  | | \__/ |    ____| |       | |       | |  ____| | | |  | | | | | | \   | | \___/ |   |  |")
   escreval ("                                 |  |     \_______/   |_| |_| |_| |_| |_| |_|  \____/     \____/        |_|       |_|  \____/  |_|  |_| |_| |_|  \__|  \_____/    |  |")
   escreval ("                                 |  |                                                                                                                             |  |")
   escreval ("                                  \  \ __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __/  / ")
   escreval ("                                   \__  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __  __ /  ")
   escreval ("                                                                                                                                      por Samuel Bezerra Pereira ")
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval
   escreval

   escreva("                                                                            D I G I T E   E N T E R   P A R A   I N I C I A R                                                                                                                                                                                           ")
   leia(op)
fimprocedimento

procedimento tutorial
var

inicio
      LIMPATELA
      escreval ("             T U T O R I A L")
      escreval ("                                    .-----------------------------------------------------------------------------------------------------------------------------.   ")
      escreval ("                                    | .-------------------------------------------------------------------------------------------------------------------------. |   ")
      escreval ("                                    | | META ATUAL: Aqui aparecerá os peixes e quantos é necessário pescar para passar à próxima. CONCLUIR GERA PONTOS DO < 2 > | |   ")
      escreval ("                                    | |------------------------+-------------------------------------------------------------------------------+----------------+ |   ")
      escreval (" Para encerrar o programa,          | |                        | < 1 > Loja onde-se compra melhorias permanentes para a pesca usando GRANA     |Grana fica aqui | |   ")
      escreval (" pressione ESC à qualquer momento.  | | < 1 > APRIMORAMENTOS   |                                                                               +----------------+ |   ")
      escreval ("                                    | |                        | < 2 > Local para aumentar a quantidade e chances dos peixes à vontade com os pontos que tiver. | |   ")
      escreval ("                                    | | < 2 > MODIFICAR LAGO   |                                                                                                | |   ")
      escreval ("                                    | |                        | < 3 > Descobrirá quando for o momento || < 4 > Limpa o lago e preenche-o novamente com peixes. | |   ")
      escreval ("                                    | | < X > TROCAR O ANZOL   |                                                                                                | |   ")
      escreval ("                                    | |                        | < 5 > Lança o anzol no lago a partir do ponto marcado com o ' \/ '                             | |   ")
      escreval ("                                    | | < 4 > Atualizar Lago   |                                                                               < 5 > LANÇAR     | |   ")
      escreval ("                                    | |                        | Concluir metas libera novos peixes. Cada peixe nasce apenas em sua Profundidade                | |   ")
      escreval ("                                  __|_|______.________.________.________.________.________.________.________.________.________.________.________|___  ___|______|_|__ ")
      escreval ("                                 ||||                                                                                                               \/            ||||")
      apresenta_lago

      escreva("                                                                            D I G I T E   E N T E R   P A R A   C O M E Ç A R                                                                                                                                                                                           ")
      leia(op)
fimprocedimento

inicio
profundidade <- 1

chances <- 30

chance_tipalinha <- 30
chance_pirocha <- 00
chance_vamlula <- 00
chance_enguangue <- 00
chance_abislapia <- 00

q_total <- 2

q_tipalinha <- 1
q_pirocha <- 0
q_vamlula <- 0
q_enguangue <- 0
q_abislapia <- 0

grana <- 0

grana <-  100000 // 0 //
bonus_q <- 0
meta_atual <- 1

meta_tipalinha <- 0
meta_pirocha <- 0
meta_vamlula <- 0
meta_enguangue <- 0
meta_abislapia <- 0

dr_linha_total <- 2

tipo_pesca <- "ANZOL"
diagonal <- falso
puxar_soltar <- falso

resultado_pesca <- ""
fisgado <- ""

para v de 0 ate 20 faca
   mexer_peixes_nome[v] <- ""
   mexer_peixes_posiX[v] <- -1
   mexer_peixes_posiy[v] <- -1

fimpara
para v de 0 ate 5 faca
melhorias[v] <- 1
fimpara

tela_inicial

tutorial

preenche_lago

repita
   atualizar_metas
   tela_principal
   opcoes
ate (meta_atual < -1)
Fimalgoritmo

      escreval ("                                    .-----------------------------------------------------------------------------------------------------------------------------.   ")
      escreval ("                                    | .-------------------------------------------------------------------------------------------------------------------------. |   ")
      escreval ("                                    | | META ATUAL: ",metas: 105,"   | |   ")
      escreval ("                                    | |------------------------+-------------------------------------------------------------------------------+----------------+ |   ")
      escreval ("                                    | |                        |                                                                               | ",apresentar_grana:14," | |   ")
      escreval ("                                    | | < 1 > APRIMORAMENTOS   |                      ____________________________________                     +----------------+ |   ")
      escreval ("                                    | |                        |                     |########/         _     /###########|                                     | |   ")
      escreval ("                                    | | < 2 > MODIFICAR LAGO   |                     |#######/         /_\   /############|                                     | |   ")
      escreval ("                                    | |                        |                     |######/         (v.v) /#############|                                     | |   ")
      escreval ("                                    | | < 3 > TROCAR O ANZOL   |                     |#####____________/ \__##############|                                     | |   ")
      escreval ("                                    | |                        |                                                                                                | |   ")
      escreval ("                                    | | < 4 > Atualizar Lago   |                                                                               < 5 > LANÇAR     | |   ")
      escreval ("                                    | |                        |                                                                                                | |   ")
      escreval ("                                  __|_|______.________.________.________.________.________.________.________.________.________.________.________|___  ___|______|_|__ ")
      escreval ("                                 ||||                                                                                                               \/            ||||")
