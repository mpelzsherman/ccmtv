class SiteController < ApplicationController
  def home
    @performances = PerformanceDecorator.decorate(Performance.top10)
    @composers    = Person.composers.top10
    @pianists     = Person.pianists.top10
    @compositions = Composition.top10
  end
end
