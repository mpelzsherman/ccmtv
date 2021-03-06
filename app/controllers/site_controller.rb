class SiteController < ApplicationController
  def top10
    @performances = PerformanceDecorator.decorate(Performance.top10.includes([:performer, :composer]))
    @composers    = Person.composers.top10
    @performers   = Person.performers.top10
    @compositions = CompositionDecorator.decorate(Composition.top10.includes(:composer))
  end
end
