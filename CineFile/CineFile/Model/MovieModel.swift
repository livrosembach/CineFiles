//
//  MovieModel.swift
//  CineFile
//
//  Created by Livia Rosembach Oliveira on 29/05/25.
//

import Foundation
import SwiftUI

struct MovieModel: Identifiable {
    let id = UUID()
    
    let title: String
    let year: String
    let synopsis: String
    let directing: String
    let screenwriters: String
    let image: String
    let gradientColor: Color
    var isFavorite: Bool = false
    var isWatched: Bool = false
    
    init(title: String, year: String, synopsis: String, directing: String, screenwriters: String, image: String, gradientColor: Color) {
        self.title = title
        self.year = year
        self.synopsis = synopsis
        self.directing = directing
        self.screenwriters = screenwriters
        self.image = image
        self.gradientColor = gradientColor
    }
}

extension MovieModel {
    static var movieData: [MovieModel] = [
        MovieModel(
            title: "Tudo em Todo o Lugar ao Mesmo Tempo",
            year: "2022",
            synopsis: "Uma imigrante chinesa de meia idade se envolve em uma aventura louca, onde só ela pode salvar o mundo explorando outros universos que se conectam com as vidas que ela poderia ter levado",
            directing: "Daniel Kwan, Daniel Scheinert",
            screenwriters: "Daniel Kwan, Daniel Scheinert",
            image: "everything_everywhere_all_at_once",
            gradientColor: .red
        ),
        MovieModel(
            title: "Cisne Negro",
            year: "2010",
            synopsis: "Uma esforçada bailarina luta para manter sua sanidade após obter o papel principal no Lago dos Cisnes de Tchaikovsky.",
            directing: "Darren Aronofsky",
            screenwriters: "Mark Heyman, Andres Heinz, John J. McLaughlin",
            image: "black_swan",
            gradientColor: .red
        ),
        MovieModel(
            title: "Barbie a princesa e a plebeia",
            year: "2004",
            synopsis: "Uma plebeia, moradora de um vilarejo, é muito parecida com a princesa do reino. Os destinos das duas se cruzam quando a princesa é sequestrada, e a moça humilde usa sua incrível semelhança com ela para tentar salvar das mãos do vilão.",
            directing: "William Lau",
            screenwriters: "Cliff Ruby, Elana Lesser, Ruth Handler",
            image: "barbie_princess_pauper",
            gradientColor: .red
        ),
        MovieModel(
            title: "Show de Truman",
            year: "1998",
            synopsis: "Truman Burbank é um pacato vendedor de seguros que leva uma vida simples com sua esposa Meryl Burbank. Porém, algumas coisas ao seu redor fazem com que ele passe a estranhar sua cidade, seus supostos amigos e até sua mulher. Após conhecer a misteriosa Lauren, ele fica intrigado e acaba descobrindo que toda sua vida foi monitorada por câmeras e transmitida em rede nacional.",
            directing: "Peter Weir",
            screenwriters: "Peter Weir, Andrew Niccol",
            image: "truman_show",
            gradientColor: .red
        ),
        MovieModel(
            title: "Spirit: O Corcel Indomável",
            year: "2002",
            synopsis: "Animação sobre a amizade entre um menino indígena e um cavalo indomável apaixonado por uma égua. Ambientada no Velho Oeste americano, mostra o impacto do processo civilizatório na vida dos três e também na amizade que construíram.",
            directing: "Kelly Asbury, Lorna Cook",
            screenwriters: "John Fusco",
            image: "spirit_stallion",
            gradientColor: .red
        ),
        MovieModel(
            title: "Labirinto do Fauno",
            year: "2006",
            synopsis: "Em 1944, na Espanha, a jovem Ofélia e sua mãe doente chegam ao posto do novo marido de sua mãe, um sádico oficial do exército que está tentando reprimir uma guerrilheira. Enquanto explorava um labirinto antigo, Ofélia encontra o Pan fauno, que diz que a menina é uma lendária princesa perdida e que ela precisa completar três tarefas perigosas a fim de se tornar imortal.",
            directing: "Guillermo del Toro",
            screenwriters: "Guillermo del Toro",
            image: "pans_labyrinth",
            gradientColor: .red
        ),
        MovieModel(
            title: "O Predestinado",
            year: "2015",
            synopsis: "Um agente precisa viajar no tempo para impedir a ação de um criminoso responsável por um ataque que mata milhares de pessoas.",
            directing: "Michael Spierig, Peter Spierig",
            screenwriters: "Michael Spierig, Peter Spierig, Robert A Heinlein (autor da obra original)",
            image: "predestination",
            gradientColor: .red
        ),
        MovieModel(
            title: "Gigantes de aço",
            year: "2011",
            synopsis: "Em um futuro próximo, as máquinas substituem os homens no ringue. As lutas de boxe acontecem entre robôs de alta tecnologia. Charlie, um ex-lutador frustrado, decide se juntar ao filho para construir um competidor imbatível.",
            directing: "Shawn Levy",
            screenwriters: "Dan Gilroy, Les Bohem, Jeremy Leven, John Gatins, Richard Matheson (autor da obra original)",
            image: "real_steel",
            gradientColor: .red
        ),
        MovieModel(
            title: "A vastidão da noite",
            year: "2019",
            synopsis: "Duas crianças procuram a fonte de uma misteriosa frequência que surgiu em sua cidade.",
            directing: "Andrew Patterson",
            screenwriters: "James Montague, Craig W. Sanger",
            image: "vast_of_night",
            gradientColor: .red
        ),
        MovieModel(
            title: "Parasita",
            year: "2019",
            synopsis: "Toda a família de Ki-taek está desempregada, vivendo em um porão sujo e apertado. Por obra do acaso, ele começa a dar aulas de inglês para uma garota de família rica. Fascinados com a vida luxuosa destas pessoas, pai, mãe e filhos bolam um plano para se infiltrar também na abastada família, um a um. No entanto, os segredos e mentiras necessários à ascensão social cobram o seu preço.",
            directing: "Bong Joon-ho",
            screenwriters: "Bong Joon-ho, Jin Won Han",
            image: "parasite",
            gradientColor: .red
        ),
        MovieModel(
            title: "Passivonas",
            year: "2023",
            synopsis: "Duas alunas não populares do último ano do ensino médio criam um clube da luta para tentar impressionar e conquistar líderes de torcida.",
            directing: "Emma Seligman",
            screenwriters: "Emma Seligman, Rachel Sennott",
            image: "bottoms",
            gradientColor: .red
        ),
        MovieModel(
            title: "turma da mônica: uma aventura no tempo",
            year: "2007",
            synopsis: "Franjinha está construindo uma máquina do tempo e precisa reunir moléculas dos quatro elementos: ar, água, fogo e terra. Mônica joga Sansão e, sem querer, acerta o aparelho, espalhando os elementos. Agora a turma precisa consertá-la.",
            directing: "Mauricio de Sousa",
            screenwriters: "Mauricio de Sousa, Flávio de Souza, Didi Oliveira, Emerson Bernardo de Abreu",
            image: "turma_da_monica_time_adventure",
            gradientColor: .red
        ),
        MovieModel(
            title: "Amnésia (Memento)",
            year: "2001",
            synopsis: "Leonard está caçando o homem que estuprou e matou sua esposa. Ele tem dificuldades em encontrar o assassino pois sofre de uma forma intratável de perda de memória. Mesmo que ele possa lembrar detalhes da vida antes do acidente, Leonard não consegue lembrar o que aconteceu quinze minutos atrás, onde está indo ou a razão.",
            directing: "Christopher Nolan",
            screenwriters: "Christopher Nolan, Jonathan Nolan",
            image: "memento",
            gradientColor: .red
        ),
        MovieModel(
            title: "Os Excêntricos Tenenbaums",
            year: "2002",
            synopsis: "Royal e sua esposa Etheline tiveram três filhos muito diferentes entre si, mas igualmente bem-sucedidos. Quando Etheline resolve se casar com outro, o irresponsável e excêntrico Royal resolve lutar por seu amor reunindo toda a família.",
            directing: "Wes Anderson",
            screenwriters: "Wes Anderson, Owen Wilson",
            image: "royal_tenenbaums",
            gradientColor: .red
        ),
        MovieModel(
            title: "La la Land",
            year: "2017",
            synopsis: "O pianista Sebastian conhece a atriz Mia, e os dois se apaixonam perdidamente. Em busca de oportunidades para suas carreiras na competitiva Los Angeles, os jovens tentam fazer o relacionamento amoroso dar certo, enquanto perseguem fama e sucesso.",
            directing: "Damien Chazelle",
            screenwriters: "Damien Chazexlle",
            image: "la_la_land",
            gradientColor: .red
        ),
        MovieModel(
            title: "Os Serviços de Entrega da Kiki",
            year: "1990",
            synopsis: "Por ordem de sua mãe, Kiki parte para um aprendizado de um ano, acompanhada por seu gato preto. A um comando de sua vassoura mágica, ela vai parar na charmosa cidadezinha de Moreoastal. Infelizmente, os hotéis locais não aceitam bruxas e a polícia a flagra fazendo algumas travessuras.",
            directing: "Hayao Miyazaki",
            screenwriters: "Hayao Miyazaki, Jack Fletcher, John Semper",
            image: "kikis_delivery_service",
            gradientColor: .red
        ),
        MovieModel(
            title: "O Feitiço de Áquila",
            year: "1985",
            synopsis: "O ladrão Gaston escapa da masmorra medieval de Aquila através da latrina. Os soldados estão prestes a matá-lo quando Navarra o salva. Navarra, viajando com seu falcão animado, planeja matar o bispo de Áquila com a ajuda de Gaston.",
            directing: "Richard Donner",
            screenwriters: "Michael Thomas, Tom Mankiewicz",
            image: "ladyhawke",
            gradientColor: .red
        ),
        MovieModel(
            title: "Os incríveis",
            year: "2004",
            synopsis: "Depois do governo banir o uso de superpoderes, o maior herói do planeta, o Sr. Incrível, vive de forma pacata com sua família. Apesar de estar feliz com a vida doméstica, o Sr. Incrível ainda sente falta dos tempos em que viveu como super-herói, e sua grande chance de entrar em ação novamente surge quando um velho inimigo volta a atacar. Só que agora ele precisa contar com a ajuda de toda a família para vencer o vilão.",
            directing: "Brad Bird",
            screenwriters: "Brad Bird",
            image: "incredibles",
            gradientColor: .red
        )
    ]
}
