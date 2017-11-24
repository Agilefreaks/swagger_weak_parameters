# frozen_string_literal: true

class PatchTestsController < ActionController::Base
  include WeakSwaggerParameters::Controller

  add_to_doc_section('Test')

  swagger_root swagger: '2.0' do
    info version: '1.0', title: 'The test api', description: 'Test api description'
    key :host, 'localhost:1234'
    key :basePath, '/'
    key :consumes, ['application/json']
    key :produces, ['application/json']
  end

  patch :update, '/tests/{id}', 'Updates a test' do
    params do
      path do
        integer :id, 'Id of the test'
      end
      body do
        string :expectations, 'Expectations'
      end
    end

    response 200
  end
  def update
    head 200
  end

  patch :custom_action, '/test/custom_action', 'Update a custom action' do
    params do
      body do
        string :expectations, 'Expectations'
      end
    end

    response 200
  end
  def custom_action
    head 200
  end
end
