require "Date"
class Tarea < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :user
  before_save :set_dates

  attr_accessor :fecha, :hora_inicio, :hora_termino
  def fecha
  end
  def hora_inicio
  end
  def hora_termino
  end



  def set_dates
     self.inicio = DateTime.strptime(@fecha.to_s + " " + @hora_inicio.to_s,"%d/%m/%Y %H:%M" )
     self.termino = DateTime.strptime(@fecha.to_s + " " + @hora_termino.to_s,"%d/%m/%Y %H:%M" )
  end

end
