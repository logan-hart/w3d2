class Card

    attr_reader :visible

    def initialize(face_value)
        @face_value = face_value
        @visible = false
    end

    def hide
        @visible = false
    end

    def reveal
        @visible = true
    end

    def to_s
        @face_value.to_s    #TODO check to_s
    end

    def ==(fv)
        @face_value == fv   #TODO consider visible comparison
    end



end
