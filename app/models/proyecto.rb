class Proyecto < ActiveRecord::Base

  has_many :tareas

  def horas_totales
    @horas_totales = 0.00
    self.tareas.each do |tarea|
      @horas_totales += tarea.total
    end
    @horas_totales
  end
end
