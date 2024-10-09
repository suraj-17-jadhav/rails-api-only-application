json.name @user.name
json.dob @user.dob
json.mobile_number @user.mobile_number
json.documents_ids @user.documents.pluck(:id)


json.health_policies do
  json.array! @user.user_health_policies.each do |user_health_policy|
    json.policy_name user_health_policy.policy_name
    json.expiry_date user_health_policy.expiry_date

    json.policy_documents do
      # Filter documents based on the file_context attribute
      policy_documents = @user.documents.where(file_context: 'policy').pluck(:id)
      json.policy_documents_ids policy_documents
    end
  end
end