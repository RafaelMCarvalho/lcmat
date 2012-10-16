# -*- encoding : utf-8 -*-
class Ability
  include CanCan::Ability

  def initialize(user, request_model)
    can :access, :rails_admin

    # Admin user rules
    if user.admin?
      can :manage, :all

      # Page rules
      cannot :destroy, Page do |page|
        page.indicator != nil
      end

      # Configuration rules
      cannot [:destroy, :create], Configuration

    # Professor user rules
    else
      can :manage, [Professor, Course]
      can :dashboard

      # Professor rules
      cannot :create, Professor
      cannot [:edit, :destroy], Professor do |professor|
        user.professor != professor
      end

      # Course rules
      cannot :create, Course
      cannot [:edit, :destroy], Course do |course|
        user.professor.own_course != course
      end

      # User rules
      can :edit, User do |user_obj|
        user_obj == user
      end
    end

    # Useless actions
    cannot :show, :all
    cannot :export, :all
    cannot :history, :all
  end
end

