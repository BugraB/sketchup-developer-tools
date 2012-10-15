# Copyright:: Copyright 2012 Trimble Navigation Ltd.
# License:: Apache License version 2.0
# Original Author:: Scott Lininger 
#
# Tests the SketchUp Ruby API Entity object.
#
# This file was originally generated by ourdoc.rb, an internal tool we developed
# specifically for outputting support files (documentation, unit tests, etc.)
# from the standard, doxygen-style c++ comments that are embedded into the
# Ruby implementation files. You can find ourdoc.rb alongside these
# implementation files at:
#
# googleclient/sketchup/source/sketchup/ruby
#

require 'test/unit'

# TC_Entity contains unit tests for the Entity class.
#
# API Object::       Entity
# C++ File::         rentity.cpp
# Parent Class::     Object
# Version::          SketchUp 6.0
#
# This is the base class for all SketchUp entities.
#
class TC_Entity < Test::Unit::TestCase

  # Setup for test cases, if required.
  #
  def setup
    erase_all()
  end

  # Some of the API examples attempt to draw arcs right on top of
  # each other, which causes validity check errors. So this is a method
  # that can be called at the beginning of a test to avoid that.
  def erase_all
    Sketchup.active_model.entities.clear!
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.model
  # @file                rentity.cpp
  #
  # The model method is used to retrieve the model for the entity.
  #
  #
  # Args:
  #
  # Returns:
  # - model: the model that contains the Entity object
  #

  # Test the example code that we have in the API documentation.
  def test_model_api_example
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts

     # I just happen to know that the second and third entities in the
     # entities objects are edges.
     entity1 = entities[1]
     m = entity1.model
    end
  end

  # Test basic use.
  def test_model_basic_use
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_line([0,0,0], [100,100,100])
    assert_equal(edge.model, model,
                 'Failed in test_model_basic_use')
  end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  def test_model_basic_use_face
    erase_all()
    model = Sketchup.active_model
    pts = []
    pts[0] = [0, 0, 0]
    pts[1] = [9, 0, 0]
    pts[2] = [9, 9, 0]
    pts[3] = [0, 9, 0]
    face = model.entities.add_face pts
    assert_equal(face.model, model,
                 'Failed in test_model_basic_use_face')
    assert_equal(model.class.to_s, "Sketchup::Model",
                 'Failed in test_model_basic_use_face')
  end

  # Test that the object returned by model is actually a Sketchup::Model
  def test_model_class_name
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_line([0,0,0], [100,100,100])
    assert_equal(edge.model.class.to_s, "Sketchup::Model",
                 'Failed in test_model_class_name')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.entityID
  # @file                rentity.cpp
  #
  # The entityID method is used to retrieve a unique ID assigned to an
  # entity.
  #
  # The entityID is not persistent between sessions.
  #
  #
  # Args:
  #
  # Returns:
  # - id: the id for the Entity object
  #

  # Test the example code that we have in the API documentation.
  def test_entityid_api_example
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts
     entity1 = entities[1]
     id = entity1.entityID
    end
  end

  # Test that entityid does not return a nil value.
  def test_entityid_not_nil
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_line([0,0,0], [100,100,100])
    assert_not_nil(edge.object_id,
                   'Failed in test_entityid_not_nil')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.parent
  # @file                rentity.cpp
  #
  # The parent method is used to retrieve the parent entity of the entity.
  # Think of the whole SketchUp model as a "Component Definition", just as
  # you can import a .skp model as a component into another .skp model.
  # Such is this reference. If an entity belongs to the top level
  # model.entities list, then its parent with be the "Model". A Component
  # Instance will have as its parent a Component Definition. An entity
  # within a Group will also have as its parent a Component Definition. In
  # the future, there may be a new "container" that more accurately
  # describes an entities "container".
  #
  #
  # Args:
  #
  # Returns:
  # - entity: a Entity object representing the parent of
  # this entity
  #

  # Test the example code that we have in the API documentation.
  def test_parent_api_example
    erase_all()
    parent = nil
    model = nil
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts

     # I just happen to know that the second and third entities in the
     # entities objects are edges.
     entity1 = entities[1]
     parent = entity1.parent
    end
    assert_equal(parent, model,
                 'Failed in test_parent' )
  end

  # Test edgecases for values passed to this method.
  def test_parent_in_group
    erase_all()
    model = Sketchup.active_model
    entities = model.active_entities
    group = entities.add_group
    group = group.to_component
    group.definition.entities.add_line([0,0,0], [9,0,0])
    assert_equal(group.definition.entities[0].parent, group.definition,
                 'Failed in test_parent_in_group')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.to_s
  # @file                rentity.cpp
  #
  # The to_s method is used to retrieve the string representation of the
  # entity.
  #
  #
  # Args:
  #
  # Returns:
  # - string: the string representation of the entity if
  # successful
  #

  # Test the example code that we have in the API documentation.
  def test_to_s_api_example
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts

     # I just happen to know that the second and third entities in the
     # entities objects are edges.
     entity1 = entities[1]
     st = entity1.to_s
    end
  end

  # Test that the edge returns the expected type.
  def test_to_s_edge
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_line([0,0,0], [100,100,100])
    assert_equal(edge.to_s.index('Sketchup::Edge'), 2,
                 'Failed in test_to_s_edge')
  end

  # Test that the edge returns the expected type.
  def test_to_s_cline
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_cline([0,0,0], [100,100,100])
    assert_equal(edge.to_s.index('Sketchup::ConstructionLine'), 2,
                 'Failed in test_to_s_cline')
  end

  # Test that the edge returns the expected type.
  def test_to_s_cline
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_text "This is a Test", [0,0,0]
    assert_equal(edge.to_s.index('Sketchup::Text'), 2,
                 'Failed in test_to_s_cline')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.typename
  # @file                rentity.cpp
  #
  # The typename method retrieves the type of the entity.
  #
  #
  # Args:
  #
  # Returns:
  # - type: the type of the entity
  #

  # Test the example code that we have in the API documentation.
  def test_typename_api_example
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts

     # I just happen to know that the second and third entities in the
     # entities objects are edges.
     entity1 = entities[1]
     type = entity1.typename
    end
  end

  # Test that the edge returns the expected type.
  def test_typename_edge
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_line([0,0,0], [100,100,100])
    assert_equal(edge.typename, 'Edge',
                 'Failed in test_typename_edge')
  end

  # Test that the edge returns the expected type.
  def test_typename_cline
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_cline([0,0,0], [100,100,100])
    assert_equal(edge.typename.index('Sketchup::ConstructionLine'),
                 'ConstructionLine', 'Failed in test_typename_cline')
  end

  # Test that the edge returns the expected type.
  def test_typename_cline
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_text "This is a Test", [0,0,0]
    assert_equal(edge.typename, 'Text',
                 'Failed in test_typename_cline')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.attribute_dictionaries
  # @file                rentity.cpp
  #
  # The AttributeDictionaries is used to retrieve the
  # attribute_dictionaries that are attached to the entity.
  #
  #
  # Args:
  #
  # Returns:
  # - attributedictionaries: the AttributeDictionaries
  # object associated with the entity, or nil if there are
  # none.
  #

  # Test the example code that we have in the API documentation.
  def test_attribute_dictionaries_api_example
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts

     # I just happen to know that the second and third entities in the
     # entities objects are edges.
     entity1 = entities[1]
     status = entity1.set_attribute "testdictionary", "test", 115
     attrdicts = entity1.attribute_dictionaries
    end
  end

  # Test edgecases for values passed to this method.
  def test_attribute_dictionaries_length
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_line([0,0,0], [9,9,9])
    status = edge.set_attribute "testdictionary", "test", 115
    status = edge.set_attribute "testdictionary2", "test", 115
    for attrdict in edge.attribute_dictionaries
      assert_equal(attrdict.length, 1,
                 'Failed in test_attribute_dictionaries_length')
    end

  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.valid?
  # @file                rentity.cpp
  #
  # The valid? method is used to determine if your entity is still valid
  # (not deleted by another script, for example.)
  #
  # This method is functionally identical to the deleted? method.
  #
  #
  # Args:
  #
  # Returns:
  # - status: true if deleted, false if not deleted
  #

  # Test the example code that we have in the API documentation.
  def test_valid_api_example
    status = nil
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts
     entity1 = entities[1]
     status = entity1.valid?
    end
    assert_equal(status, true,
                 'Failed in test_valid_api_example')
  end


  # Test edgecases for values passed to this method.
  def test_valid_false
    erase_all()
    status = nil
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts
     entity1 = entities[1]
     entity1.erase!
     status = entity1.valid?
    end
    assert_equal(status, false,
                 'Failed in test_valid_false')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.attribute_dictionary
  # @file                rentity.cpp
  #
  # The AttributeDictionary method is used to retrieve an attribute
  # dictionary with a given name that is attached to an Entity.
  #
  #
  # Args:
  # - name: The name of the attribute dictionary.
  # - create: (optional) boolean, if set to true then the attribute
  # dictionary will be created if it does not exist.
  #
  # Returns:
  # - attributedictionary: an AttributeDictionary object if
  # successful, or nil if there is no attribute dictionary
  #

  # Test the example code that we have in the API documentation.
  def test_attribute_dictionary_api_example
    attrdict = nil
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts

     # I just happen to know that the second and third entities in the
     # entities objects are edges.
     entity1 = entities[1]
     status = entity1.set_attribute "testdictionary", "test", 115
     attrdict = entity1.attribute_dictionary "testdictionary"
    end
    assert_not_nil(attrdict,
                   'Failed in test_attribute_dictionary')
  end


  # Test that something will return nil if there is no matching dict
  def test_attribute_dictionary_nil
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_line([0,0,0], [9,9,9])
    status = edge.set_attribute "testdictionary", "test", 115
    status = edge.set_attribute "testdictionary2", "test", 115

    assert_not_nil(edge.attribute_dictionary('testdictionary'),
                   'Failed in test_attribute_dictionary_nil')
    assert_not_nil(edge.attribute_dictionary('testdictionary2'),
                   'Failed in test_attribute_dictionary_nil')
    assert_nil(edge.attribute_dictionary('nothing'),
               'Failed in test_attribute_dictionary_nil')
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.delete_attribute
  # @file                rentity.cpp
  #
  # The delete_attribute method is used to delete an attribute from an
  # entity.
  #
  # If only the dictionary_name is given, then it deletes the entire
  # AttributeDictionary. Otherwise, delete_attribute deletes the attribute
  # with the given key from the given dictionary.
  #
  #
  # Args:
  # - dictionary_name: The name of an attribute dictionary.
  # - key: An attribute key.
  #
  # Returns:
  # - : nil
  #

  # Test the example code that we have in the API documentation.
  def test_delete_attribute_api_example
    status = nil
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]
     # Add the face to the entities in the model
     face = entities.add_face pts

     # I just happen to know that the second and third entities in the
     # entities objects are edges.
     entity1 = entities[1]
     status = entity1.set_attribute "testdictionary", "test", 115
     status = entity1.delete_attribute "testdictionary"
    end
    assert_equal(status, true,
                 'Failed in test_delete_attribute' )
  end


  # Test basic usage.
  def test_delete_attribute_basic
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_line([0,0,0], [9,9,9])
    status = edge.set_attribute "testdictionary", "test", 115
    status = edge.set_attribute "testdictionary2", "test", 115

    assert_equal(edge.get_attribute('testdictionary', 'test', false), 115,
                   'Failed in test_delete_attribute_basic')
    assert_equal(edge.get_attribute('testdictionary2', 'test', false), 115,
                   'Failed in test_delete_attribute_basic')

    edge.delete_attribute('testdictionary', 'test')
    edge.delete_attribute('testdictionary2', 'test')

    assert_equal(edge.get_attribute('testdictionary', 'test', false), false,
                   'Failed in test_delete_attribute_basic')
    assert_equal(edge.get_attribute('testdictionary2', 'test', false), false,
                   'Failed in test_delete_attribute_basic')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.get_attribute
  # @file                rentity.cpp
  #
  # The get_attribute method is used to retrieve the value of an attribute
  # in the entity's attribute dictionary.
  #
  # In the first form, if there is no attribute that matches the given
  # names, it returns nil.
  #
  # In the second form, if there is no attribute, it returns the given
  # default value. It does not create an attribute with that name though.
  #
  #
  # Args:
  # - dictionary_name: The name of an attribute dictionary.
  # - key: An attribute key.
  # - default_value: A default value to return if no attribute is found.
  #
  # Returns:
  # - value: the retrieved value
  #

  # Test the example code that we have in the API documentation.
  def test_get_attribute_api_example
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts

     # I just happen to know that the second and third entities in the
     # entities objects are edges.
     entity1 = entities[1]
     status = entity1.set_attribute "testdictionary", "test", 115
     value = entity1.get_attribute "testdictoinary", "test"
    end
  end

   # Test basic usage.
  def test_get_attribute_basic
    erase_all()
    model = Sketchup.active_model
    edge = model.entities.add_line([0,0,0], [9,9,9])
    status = edge.set_attribute "testdictionary", "test", 115
    status = edge.set_attribute "testdictionary2", "test", 115

    assert_equal(edge.get_attribute('testdictionary', 'test', false), 115,
                   'Failed in test_delete_attribute_basic')
    assert_equal(edge.get_attribute('testdictionary2', 'test', false), 115,
                   'Failed in test_delete_attribute_basic')

    edge.delete_attribute('testdictionary', 'test')
    edge.delete_attribute('testdictionary2', 'test')

    assert_equal(edge.get_attribute('testdictionary', 'test', false), false,
                   'Failed in test_delete_attribute_basic')
    assert_equal(edge.get_attribute('testdictionary2', 'test', false), false,
                   'Failed in test_delete_attribute_basic')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.add_observer
  # @file                rentity.cpp
  #
  # The add_observer method is used to add an observer to the current
  # object.
  #
  #
  # Args:
  # - observer: An observer.
  #
  # Returns:
  # - : true if successful, false if unsuccessful.
  #

  # Test the example code that we have in the API documentation.
  def test_add_observer_api_example
    observer = Object.new
    assert_nothing_raised do
     entities = Sketchup.active_model.entities
     edge = entities.add_line([0,0,0], [9,9,9])
     status = edge.add_observer observer
    end
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.set_attribute
  # @file                rentity.cpp
  #
  # The set attribute is used to set the value of an attribute in an
  # attribute dictionary with the given name.
  #
  # This method will create a new AttributeDictionary if none exists.
  #
  #
  # Args:
  # - dict_name: The name of an attribute dictionary.
  # - key: An attribute key.
  # - value: The value for the attribute.
  #
  # Returns:
  # - value: the newly set value if successful
  #

  # Test the example code that we have in the API documentation.
  def test_set_attribute_api_example
    status = nil
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts

     # I just happen to know that the second and third entities in the
     # entities objects are edges.
     entity1 = entities[1]
     status = entity1.set_attribute "testdictionary", "test", 115
    end
    assert_equal(status, 115,
                 'Failed in test_set_attribute')
  end

  def test_set_attribute_twice
    model = Sketchup.active_model
    entities = model.active_entities
    edge = entities.add_line([0,0,0],[9,9,9])
    status = edge.set_attribute "testdictionary", "test", 115
    assert_equal(status, 115,
                 'Failed in test_set_attribute_twice')

    status = edge.set_attribute "testdictionary", "test", 120
    assert_equal(status, 120,
                 'Failed in test_set_attribute_twice')
  end

  def test_set_attribute_boolean
    model = Sketchup.active_model
    entities = model.active_entities
    edge = entities.add_line([0,0,0],[9,9,9])
    status = edge.set_attribute "testdictionary", "test", true
    assert_equal(status, true,
                 'Failed in test_set_attribute_boolean')
  end

  def test_set_attribute_string
    model = Sketchup.active_model
    entities = model.active_entities
    edge = entities.add_line([0,0,0],[9,9,9])
    status = edge.set_attribute "testdictionary", "test", "go"
    assert_equal(status, "go",
                 'Failed in test_set_attribute_string')
  end

  def test_set_attribute_float
    model = Sketchup.active_model
    entities = model.active_entities
    edge = entities.add_line([0,0,0],[9,9,9])
    status = edge.set_attribute "testdictionary", "test", 5.5
    assert_equal(status, 5.5,
                 'Failed in test_set_attribute_float')
  end

  def test_set_attribute_float
    model = Sketchup.active_model
    entities = model.active_entities
    edge = entities.add_line([0,0,0],[9,9,9])
    status = edge.set_attribute "testdictionary", "test", 5.5
    assert_equal(status, 5.5,
                 'Failed in test_set_attribute_float')
  end

  def test_set_attribute_negative_int
    model = Sketchup.active_model
    entities = model.active_entities
    edge = entities.add_line([0,0,0],[9,9,9])
    status = edge.set_attribute "testdictionary", "test", -100
    assert_equal(status, -100,
                 'Failed in test_set_attribute_negative_int')
  end

  def test_set_attribute_negative_float
    model = Sketchup.active_model
    entities = model.active_entities
    edge = entities.add_line([0,0,0],[9,9,9])
    status = edge.set_attribute "testdictionary", "test", -100.5
    assert_equal(status, -100.5,
                 'Failed in test_set_attribute_negative_float')
  end

  def test_set_attribute_nil
    model = Sketchup.active_model
    entities = model.active_entities
    edge = entities.add_line([0,0,0],[9,9,9])
    status = edge.set_attribute "testdictionary", "test", nil
    assert_equal(status, nil,
                 'Failed in test_set_attribute_nil')
  end


  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.remove_observer
  # @file                rentity.cpp
  #
  # The remove_observer method is used to remove an observer from the
  # current object.
  #
  #
  # Args:
  # - observer: An observer.
  #
  # Returns:
  # - : true if successful, false if unsuccessful.
  #

  # Test the example code that we have in the API documentation.
  def test_remove_observer_api_example
    observer = Object.new
    assert_nothing_raised do
      entities = Sketchup.active_model.entities
      entity = entities.add_line([0,0,0], [9,9,9])
      status = entity.remove_observer observer
    end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Entity.deleted?
  # @file                rentity.cpp
  #
  # The deleted? method is used to determine if your entity is still valid
  # (not deleted by another script, for example.)
  #
  #
  # Args:
  #
  # Returns:
  # - status: true if deleted, false if not deleted
  #

  # Test the example code that we have in the API documentation.
  def test_deleted_api_example
    status = nil
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts
     entity1 = entities[1]
     status = entity1.deleted?
    end
    assert_equal(status, false,
                 'Failed in test_deleted' )
  end

  def test_deleted_true
    status = nil
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [width, 0, 0]
     pts[2] = [width, depth, 0]
     pts[3] = [0, depth, 0]

     # Add the face to the entities in the model
     face = entities.add_face pts
     entity1 = entities[1]
     assert_equal(entity1.deleted?, false,
                 'Failed in test_deleted' )
     entity1.erase!
     assert_equal(entity1.deleted?, true,
                 'Failed in test_deleted' )
    end

  end

end