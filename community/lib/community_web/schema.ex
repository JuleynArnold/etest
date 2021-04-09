defmodule CommunityWeb.Schema do
    use Absinthe.Schema

    alias CommunityWeb.ContactResolver

    query do
        @desc "Get Contact"
        field :get_contact, non_null(:contact) do
            arg :id, non_null(:id)
            resolve(&ContactResolver.get_contact/3)
        end
    end

    mutation do
        @desc "Create a new Contact"
        field :create_contact, :contact do
            arg :name, :name_input
            arg :phone, :phone_input
            arg :company, :company_input
            arg :email, :email_input
            arg :address, :address_input

            resolve(&ContactResolver.create_contact/3)
        end
    end

    object :contact do
        field :id, non_null(:id)
        field :name, :name do
            resolve(fn contact, _, _ ->
                {:ok, %{
                    first_name: contact.name["first_name"],
                    middle_name: contact.name["middle_name"],
                    last_name: contact.name["last_name"]
                    }
                }
            end)
        end
        field :phone, :phone do
            resolve(fn contact, _, _ ->
                {:ok, %{
                    number: contact.phone["number"],
                    type: contact.phone["type"]
                    }
                }
            end)
        end
        field :company, :company do
            resolve(fn contact, _, _ ->
                {:ok, %{
                    company_name: contact.company["company_name"],
                    job_title: contact.company["job_title"]
                    }
                }
            end)
        end
        field :email, :email do
            resolve(fn contact, _, _ ->
                {:ok, %{
                    email_address: contact.email["email_address"],
                    type: contact.email["type"]
                    }
                }
            end)
        end
        field :address, :address do
            resolve(fn contact, _, _ ->
                {:ok, %{
                    address1: contact.address["address1"],
                    address2: contact.address["address2"],
                    city: contact.address["city"],
                    state: contact.address["state"],
                    zip: contact.address["zip"]
                    }
                }
            end)
        end
    end

    object :name do
        field :first_name, :string
        field :middle_name, :string
        field :last_name, :string
    end

    object :phone do
        field :number, :string
        field :type, :string
    end

    object :company do
        field :company_name, :string
        field :job_title, :string
    end

    object :email do
        field :email_address, :string
        field :type, :string
    end

    object :address do
        field :address1, :string
        field :address2, :string
        field :city, :string
        field :state, :string
        field :zip, :string
        field :country, :string
        field :type, :string
    end


    input_object :name_input do
        field :first_name, :string
        field :middle_name, :string
        field :last_name, :string
    end

    input_object :phone_input do
        field :number, :string
        field :type, :string
    end

    input_object :company_input do
        field :company_name, :string
        field :job_title, :string
    end

    input_object :email_input do
        field :email_address, :string
        field :type, :string
    end

    input_object :address_input do
        field :address1, :string
        field :address2, :string
        field :city, :string
        field :state, :string
        field :zip, :string
        field :country, :string
        field :type, :string
    end
end
