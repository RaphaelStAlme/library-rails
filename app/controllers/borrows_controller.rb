class BorrowsController < ApplicationController
    before_action :set_borrow, only: [:destroy]

    # POST /borrows
    def create
        @borrow = Borrow.new(borrow_params)
        if @borrow.save
            render json: @borrow, status: :created, location: @borrow
        else
            render json: @borrow.errors, status: :unprocessable_entity
        end
    end

    # DELETE /borrows/:id
    def destroy
        # Mettre à jour l'emprunt pour indiquer qu'il est terminé
        # par exemple, en définissant une date de fin ou en changeant un statut
        if @borrow.update(returned: true) # Supposons qu'il y ait un attribut `returned`
            render json: { message: "Emprunt terminé avec succès" }
        else
            render json: @borrow.errors, status: :unprocessable_entity
        end
    end

    private

        def set_borrow
            @borrow = Borrow.find(params[:id])
        end

        # Only allow a list of trusted parameters through.
        def borrow_params
            params.require(:borrow).permit(:book_id, :user_id, :start_date, :due_date)
            # Assurez-vous d'ajuster les paramètres autorisés en fonction de votre modèle
        end
end