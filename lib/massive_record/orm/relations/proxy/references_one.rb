module MassiveRecord
  module ORM
    module Relations
      class Proxy
        class ReferencesOne < Proxy

          
          def target=(target)
            owner.send(foreign_key_setter, target.id) if owner && target && persisting_foreign_key?
            super(target)
          end


          private

          def find_target
            class_name.constantize.find(owner.send(foreign_key))
          end

          def can_find_target?
            owner.send(foreign_key).present?
          end
        end
      end
    end
  end
end
