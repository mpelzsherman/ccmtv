class SiteController < ApplicationController
  def top10
    @performances = PerformanceDecorator.decorate(Performance.top10)
    @composers    = Person.composers.top10
    @pianists     = Person.pianists.top10
    @compositions = CompositionDecorator.decorate(Composition.top10)
  end
end
