A limpeza de código passou pela redução do tamanho dos métodos. A minha solução da semana passada tinham alguns code smells. Tanto o meu método roll, como o meu método score, tinham mais de cinco linhas, era difícil de compreender o que cada método fazia e no método score existia diferentes níveis de nesting. Para resolver este problema ambos os métodos foram divididos em métodos mais pequenos recorrendo a métodos auxiliares.
Em relação aos padrões, ao analisar a nova solução foi possível identificar que tanto o padrão observer como o padrão strategy não poderiam ser implementados já que não se encaixavam no ambito da solução. Quanto ao padrão decorator, considerando que não existem muitos objetos relacionados, também não faria qualquer sentido implementa-lo.
