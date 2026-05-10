# BDD-PI

## Introducao
O BDD-PI e um projeto de especificacao de produto voltado para inspecao de pavimentos com apoio de inteligencia artificial. A ideia central e simples: o usuario envia fotos e videos (principalmente capturados por drone) e recebe de volta a identificacao de defeitos, como buracos, panelas e trincas, para apoiar a tomada de decisao em manutencao viaria.

Alem da identificacao automatica, o projeto tambem considera necessidades reais de campo e de gestao, como estimativa de dimensoes/profundidade dos defeitos, calculo de indices tecnicos de manutencao e organizacao das informacoes para uso por equipes tecnicas.

O publico-alvo inclui orgaos executivos de transito (nacional, estadual e municipal) e concessionarias de rodovias, que precisam de um processo mais rapido, padronizado e confiavel para analisar condicoes de vias.

## Estrutura BDD

Todo o projeto esta descrito em arquivos `.feature` dentro de `BDD/` (nao apenas os requisitos nao funcionais). A organizacao segue uma estrutura hierarquica para facilitar leitura, rastreabilidade e evolucao:

- **Epicos**: agrupam grandes blocos de capacidade do produto.
- **Features**: detalham funcionalidades dentro de cada epico.
- **User Stories (US)**: descrevem cenarios de comportamento no formato Given/When/Then. Usando `.feature`.
- **Requisitos nao funcionais (RNF)**: tambem documentados em `.feature`, com foco em seguranca, desempenho, confiabilidade, conformidade tecnica e usabilidade.

Com isso, os requisitos funcionais e nao funcionais ficam no mesmo padrao de especificacao, deixando o projeto mais claro para time tecnico, stakeholders e avaliadores. Seguindo o padrao do `BDD`.
