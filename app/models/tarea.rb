require "Date"
class Tarea < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :user
  before_save :set_dates



  attr_accessor :fecha, :hora_inicio, :hora_termino, :total


  
  
  
  def fecha
    if inicio
       self.fecha = self.inicio.strftime("%d-%m-%Y")
    end
  end
  def hora_inicio
    if inicio
      self.hora_inicio = self.inicio.strftime("%H:%M")
    end
  end
  def hora_termino
    if termino
      self.hora_termino = self.termino.strftime("%H:%M")
    end

  end


  def set_dates
     self.inicio = DateTime.strptime(@fecha.to_s + " " + @hora_inicio.to_s,"%d/%m/%Y %H:%M" )
     self.termino = DateTime.strptime(@fecha.to_s + " " + @hora_termino.to_s,"%d/%m/%Y %H:%M" )
  end

  def total
    (self.termino - self.inicio) / 3600
  end



end
