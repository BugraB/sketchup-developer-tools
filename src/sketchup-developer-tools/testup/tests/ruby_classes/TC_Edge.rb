# Copyright:: Copyright 2012 Trimble Navigation Ltd.
# License:: Apache License version 2.0
# Original Author:: Scott Lininger 
#
# Tests the SketchUp Ruby API Edge object.
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

# TC_Edge contains unit tests for the Edge class.
#
# API Object::       Edge
# C++ File::         redge.cpp
# Parent Class::     Drawingelement
# Version::          SketchUp 6.0
#
# The Edge class contains methods modifying and extracting information for
# edges.
#
#
class TC_Edge < Test::Unit::TestCase

  # Setup for test cases, if required.
  #
  def setup
    def UI::messagebox(params)
      puts 'TESTUP OVERRIDE: UI::messagebox > ' + params.to_s
    end

    entities_to_erase = []
    for entity in Sketchup.active_model.entities
      entities_to_erase.push entity
    end

    for entity in entities_to_erase
      if entity.valid?
        entity.erase!
      end
    end
  end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.common_face
  # @file                redge.cpp
  #
  # The common_face method is used to identify a face that is common to
  # two edges.
  #
  #
  #
  # Args:
  # - edge2: The face whose edge you are checking for commonality.
  #
  # Returns:
  # - face: the Face object that is common to the two edges
  # if successful
  #

  # Test the example code that we have in the API documentation.
  def test_common_face_api_example
    assert_nothing_raised do
     depth = 100
     width = 100
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0,0,0]
     pts[1] = [width,0,0]
     pts[2] = [width,depth,0]
     pts[3] = [0,depth,0]
     # Add the face to the entities in the model
     face = entities.add_face pts
     # I know that the second and third entity objects are edges
     entity1 = entities[1]
     entity2 = entities[2]
     UI.messagebox entity1
     UI.messagebox entity2
     face = entity1.common_face entity2
     if (face)
       UI.messagebox face
     else
       UI.messagebox "Failure: No Common Face"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_common_face_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_common_face_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_common_face_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.smooth?
  # @file                redge.cpp
  #
  # The smooth? method is used to retrieve the current smooth setting for
  # an edge.
  #
  #
  #
  # Args:
  #
  # Returns:
  # - status: true if smooth, false if not smooth
  #

  # Test the example code that we have in the API documentation.
  def test_smooth_api_example
    assert_nothing_raised do
     entity = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     # Examine the current smooth setting on an edge.
     status = entity.smooth?
     if (status)
       # If true, set it to false
       UI.messagebox "Smooth"
       status = entity.smooth="false"
     else
       # if false, set it to true
       UI.messagebox "Not Smooth"
       status = entity.smooth="true"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_smooth_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_smooth_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_smooth_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.explode_curve
  # @file                redge.cpp
  #
  # The explode_curve method is used to explode an edge as though it were
  # an ArcCurve.
  #
  #
  # Args:
  #
  # Returns:
  # - edge: an exploded edge object if successful
  #

  # Test the example code that we have in the API documentation.
  def test_explode_curve_api_example
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
     # I just happen to know that the second entity in the
     # entities objects is an edge.
     entity1 = entities[1]
     curve = entity1.explode_curve
     if (curve)
       UI.messagebox curve
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_explode_curve_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_explode_curve_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_explode_curve_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.find_faces
  # @file                redge.cpp
  #
  # The find_faces method is used to create all of the Faces that can be
  # created with this edge. For example, if you use the API to draw three
  # edges that form a triangle, the face between them will not show up
  # because you've only drawn the edges, but if you call find_faces on one
  # of the edges, the triangle will be filled in.
  #
  #
  # Args:
  #
  # Returns:
  # - number: the number of faces found
  #

  # Test the example code that we have in the API documentation.
  def test_find_faces_api_example
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
     # I just happen to know that the second entity in the
     # entities objects is an edge.
     entity1 = entities[1]
     # Getting zero.
     number = entity1.find_faces
     if (number)
       UI.messagebox "I created " + number.to_s + " faces."
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_find_faces_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_find_faces_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_find_faces_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.length
  # @file                redge.cpp
  #
  # The length method is used to retrieve the length of an edge in current
  # units.
  #
  #
  #
  # Args:
  #
  # Returns:
  # - length: the length of the edge in current units
  #

  # Test the example code that we have in the API documentation.
  def test_length_api_example
    assert_nothing_raised do
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     length = edge.length
     if (length)
       UI.messagebox length
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_length_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_length_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_length_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.soft=
  # @file                redge.cpp
  #
  # The smooth= method is used to set the edge to be soft.
  #
  #
  # Args:
  # - value: true if you want the edge to be soft, false if you do not
  # want the edge to be soft.
  #
  # Returns:
  # - status: true if successful, false if unsuccessful
  #

  # Test the example code that we have in the API documentation.
  def test_set_soft_api_example
    assert_nothing_raised do
     entity = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     # Examine the current soft setting on an edge.
     status = entity.soft?
     if (status)
       # If true, set it to false
       UI.messagebox "Soft"
       status = entity.soft="false"
     else
       # if false, set it to true
       UI.messagebox "Not Soft"
       status = entity.soft="true"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_set_soft_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_set_soft_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_set_soft_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.reversed_in?
  # @file                redge.cpp
  #
  # The reversed_in? method is used to determine if the EdgeUse object is
  # traversed in the corresponding direction as its corresponding edge.
  #
  #
  # Args:
  # - face: The Face object that is bounded by the edge.
  #
  # Returns:
  # - status: true if the edge is reversed, nil if it is not
  # reversed.
  #

  # Test the example code that we have in the API documentation.
  def test_reversed_in_api_example
    assert_nothing_raised do
     model = Sketchup.active_model
     entities = model.active_entities
     pts = []
     pts[0] = [0, 0, 0]
     pts[1] = [9, 0, 0]
     pts[2] = [9, 9, 0]
     pts[3] = [0, 9, 0]
     # Add the face to the entities in the model
     face = entities.add_face pts
     edge = face.edges[0]
     begin
       # When the geometry is a 2d rectangle with four edges, the face itself
       # is entities[4]
       status = edge.reversed_in? face
     rescue
       UI.messagebox $!.message
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_reversed_in_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_reversed_in_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_reversed_in_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.end
  # @file                redge.cpp
  #
  # The end method is used to retrieve the Vertex object at the end of the
  # edge.
  #
  #
  # Args:
  #
  # Returns:
  # - vertex: a Vertex object if successful
  #

  # Test the example code that we have in the API documentation.
  def test_end_api_example
    assert_nothing_raised do
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     vertex = edge.end
     if (vertex)
       # display a pointer to the Vertex
       UI.messagebox vertex
     else
       UI.messagebox "Failure"
     end
     point = vertex.position
     # Let's get the Point3d of the vertex
     if (point)
       UI.messagebox point
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_end_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_end_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_end_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.soft?
  # @file                redge.cpp
  #
  # The soft? method is used to retrieve the current smooth setting for an
  # edge. A soft edge is automatically hidden unless it is shows up as a
  # profile edge.
  #
  #
  # Args:
  #
  # Returns:
  # - status: true if soft, false if not soft
  #

  # Test the example code that we have in the API documentation.
  def test_soft_api_example
    assert_nothing_raised do
     entity = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     # Examine the current soft setting on an edge.
     status = entity.soft?
     if (status)
       # If true, set it to false
       UI.messagebox "Soft"
       status = entity.soft="false"
     else
       # if false, set it to true
       UI.messagebox "Not Soft"
       status = entity.soft="true"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_soft_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_soft_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_soft_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.used_by?
  # @file                redge.cpp
  #
  # The used_by? method is used to see if an edge is used by a given Face
  # or Vertex.
  #
  #
  # Args:
  # - element: A Vertex or Face object.
  #
  # Returns:
  # - status: true if the face belongs to the element,
  # false if not.
  #

  # Test the example code that we have in the API documentation.
  def test_used_by_api_example
    assert_nothing_raised do
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     # Returns a vertex
     vertex = edge.start
     # Check to see if the edge is used by the Vertex.
     status = edge.used_by? vertex
     if (status)
       UI.messagebox status
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_used_by_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_used_by_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_used_by_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.faces
  # @file                redge.cpp
  #
  # The faces method is used to retrieve all of the faces common to the
  # edge.
  #
  #
  # Args:
  #
  # Returns:
  # - faces: an array of Face objects if successful, false
  # if unsuccessful
  #

  # Test the example code that we have in the API documentation.
  def test_faces_api_example
    assert_nothing_raised do
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     faces = edge.faces
     if (faces)
       # Display the pointer to the first face returned in the array
       UI.messagebox faces[0]
     else
       UI.messagebox "Failure: No Faces Found"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_faces_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_faces_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_faces_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.start
  # @file                redge.cpp
  #
  # The end method is used to retrieve the Vertex object at the start of
  # the edge.
  #
  #
  #
  # Args:
  #
  # Returns:
  # - vertex: a Vertex object if successful
  #

  # Test the example code that we have in the API documentation.
  def test_start_api_example
    assert_nothing_raised do
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     vertex = edge.start
     if (vertex)
       # display a pointer to the Vertex
       UI.messagebox vertex
     else
       UI.messagebox "Failure"
     end
     point = vertex.position
     # Let's get the Point3d of the vertex
     if (point)
       UI.messagebox point
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_start_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_start_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_start_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.other_vertex
  # @file                redge.cpp
  #
  # The other_vertex method is used to find the opposite vertex given one
  # vertex of the edge.
  #
  #
  # Args:
  # - vertex1: One of the Vertex objects associated with the edge.
  #
  # Returns:
  # - vertex2: the other Vertex object associated with the
  # edge
  #

  # Test the example code that we have in the API documentation.
  def test_other_vertex_api_example
    assert_nothing_raised do
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     # Get the end vertex of an edge
     vertex = edge.end
     # Should find the starting vertex
     othervertex = edge.other_vertex vertex
     if (othervertex)
       UI.messagebox othervertex
     else
       UI.messagebox "Failure"
     end
     # The Point3d for the vertex
     point = othervertex.position
     if (point)
       UI.messagebox point
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_other_vertex_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_other_vertex_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_other_vertex_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.smooth=
  # @file                redge.cpp
  #
  # The smooth= method is used to set the edge to be smooth.
  #
  #
  # Args:
  # - value: true if you want the edge to be smooth, false if you do not
  # want the edge to be smooth.
  #
  # Returns:
  # - status: true if successful, false if unsuccessful
  #

  # Test the example code that we have in the API documentation.
  def test_set_smooth_api_example
    assert_nothing_raised do
     entity = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     # Examine the current smooth setting on an edge.
     status = entity.smooth?
     if (status)
       # If true, set it to false
       UI.messagebox "Smooth"
       status = entity.smooth="false"
     else
       # if false, set it to true
       UI.messagebox "Not Smooth"
       status = entity.smooth="true"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_set_smooth_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_set_smooth_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_set_smooth_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.all_connected
  # @file                redge.cpp
  #
  # The all_connected method retrieves all of the entities connected to an
  # edge.
  #
  #
  # Args:
  #
  # Returns:
  # - entities: the entities connected to the edge
  #

  # Test the example code that we have in the API documentation.
  def test_all_connected_api_example
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
     entity2 = entities[2]
     edges = entity1.all_connected
     if (edges)
       UI.messagebox edges.to_s
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_all_connected_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_all_connected_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_all_connected_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.curve
  # @file                redge.cpp
  #
  # The curve method is used to determine if an edge to see if it is a
  # ArcCurve object.
  #
  #
  #
  # Args:
  #
  # Returns:
  # - arccurve: returns an ArcCurve object if it is a curve,
  # false if it is not a curve
  #

  # Test the example code that we have in the API documentation.
  def test_curve_api_example
    assert_nothing_raised do
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     curve = edge.curve
     if (curve)
       # if it is a curve, display a pointer to the curve
       UI.messagebox curve
     else
       UI.messagebox "Failure: Not a Curve"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_curve_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_curve_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_curve_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.split
  # @file                redge.cpp
  #
  # The split method is used to to split an edge into to or more distinct
  # edges. If a Point3d is given, it must be a point that is on the Edge.
  #
  # If a Float is given, it is a number between 0 and 1 that gives the
  # relative position along the edge at which to split it. For example,
  # edge.split(0.5) will split the Edge at its midpoint. This split
  # position is measured from the Edge.start.
  #
  # Returns the new Edge that was created as a result of splitting this
  # one.
  #
  #
  # Args:
  # - position: A Point3d object whose location is along the edge, or a
  # Float between 0.0 and 1.0 defining how far along the edge to split.
  #
  # Returns:
  # - edge: the new Edge object that was split off
  # the old one if successful
  #

  # Test the example code that we have in the API documentation.
  def test_split_api_example
    assert_nothing_raised do
     # Split a line in half.
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     new_edge = edge.split 0.5
    end
  end

  # Test edgecases for values passed to this method.
  #def test_split_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_split_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_split_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.line
  # @file                redge.cpp
  #
  # The line method is used to retrieve the line defined by the edge.
  # Lines in SketchUp aren't visible entities but geometric constructs
  # represented by an Array with a Point3d and a Vector3d. See the Geom
  # module and the Array class for more information on lines.
  #
  #
  # Args:
  #
  # Returns:
  # - line: an array with a Point3d object and a Vector3d
  # object.
  #

  # Test the example code that we have in the API documentation.
  def test_line_api_example
    assert_nothing_raised do
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     # Returns a 3d ray
     line = edge.line
     if (line)
       UI.messagebox line
     else
       UI.messagebox "Failure"
     end
    end
  end

  # Test edgecases for values passed to this method.
  #def test_line_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_line_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_line_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

  # ----------------------------------------------------------------------------
  # @par Ruby Method:    Edge.vertices
  # @file                redge.cpp
  #
  # The vertices method is used to retrieve the vertices on the edge.
  #
  #
  # Args:
  #
  # Returns:
  # - vertices: an array of Vertex objects
  #

  # Test the example code that we have in the API documentation.
  def test_vertices_api_example
    assert_nothing_raised do
     edge = Sketchup.active_model.entities.add_line([0,0,0],[100,100,0])
     vertices = edge.vertices
    end
  end

  # Test edgecases for values passed to this method.
  #def test_vertices_edgecases
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_equal('expected', 'result',
  #               'Failed in test_vertices_edgecases' )
  #end

  # Test what happens when bad arguments are passed (nil, too few, etc.)
  #def test_vertices_bad_params
  #  raise('AUTOGENERATED STUB. Do manual review, then delete this warning.')
  #  assert_raise RuntimeError do
  #    # bad arguments here that should cause errors
  #  end
  #end

end
