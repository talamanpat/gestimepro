class Proyecto < ActiveRecord::Base

  validates :nombre, :presence => true, :uniqueness => true


  has_many :tareas



  def horas_totales
    @horas_totales = 0.00
    self.tareas.each do |tarea|
      @horas_totales += tarea.total
    end
    @horas_totales
  end
end
