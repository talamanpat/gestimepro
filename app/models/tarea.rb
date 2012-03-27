require "Date"
class Tarea < ActiveRecord::Base
  belongs_to :proyecto
  belongs_to :user
  before_validation :set_dates




  attr_accessor :fecha, :hora_inicio, :hora_termino, :total

  validates :proyecto_id,
            :presence => true

  validates :user_id,
            :presence => true

  validates :nombre,
            :presence => true

#  validates :fecha,
#            :presence => true

#  validates :hora_inicio,
#            :presence => true

#  validates :hora_termino,
#            :presence => true

  validates :inicio,
            :presence => true

  validates :termino,
            :presence => true




  def fecha
    if inicio
       self.fecha = self.inicio.strftime("%d/%m/%Y")
    else if termino
          self.fecha = self.termino.strftime("%d/%m/%Y")
         end
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
    if @fecha.strip != "" && @hora_inicio.strip != ""
     self.inicio = DateTime.strptime(@fecha.to_s + " " + @hora_inicio.to_s,"%d/%m/%Y %H:%M" )
    end
    if @fecha.strip != "" && @hora_termino.strip != ""
     self.termino = DateTime.strptime(@fecha.to_s + " " + @hora_termino.to_s,"%d/%m/%Y %H:%M" )

    end

  end

  def total
    (self.termino - self.inicio) / 3600
  end


end

