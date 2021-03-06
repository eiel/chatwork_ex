defmodule ChatworkEx.Response.Me do
  defstruct [
    :account_id,
    :room_id,
    :name,
    :chatwork_id,
    :organization_id,
    :organization_name,
    :department,
    :title,
    :url,
    :mail,
    :tel_organization,
    :tel_extension,
    :tel_mobile,
    :skype,
    :facebook,
    :twitter,
    :avatar_image_url,
    :login_mail
  ]

  @type t :: %__MODULE__{
          account_id: pos_integer,
          room_id: pos_integer,
          name: bitstring,
          chatwork_id: bitstring,
          organization_id: pos_integer,
          organization_name: bitstring,
          department: bitstring,
          title: bitstring,
          mail: bitstring,
          tel_organization: bitstring,
          skype: bitstring,
          facebook: bitstring,
          twitter: bitstring,
          avatar_image_url: bitstring,
          login_mail: bitstring
        }
end
