/*
##Copyright 2008-2009 Thomas Paviot
##
##thomas.paviot@free.fr
##
##pythonOCC is a computer program whose purpose is to provide a complete set
##of python bindings for OpenCascade library.
##
##This software is governed by the CeCILL license under French law and
##abiding by the rules of distribution of free software.  You can  use, 
##modify and/ or redistribute the software under the terms of the CeCILL
##license as circulated by CEA, CNRS and INRIA at the following URL
##"http://www.cecill.info". 
##
##As a counterpart to the access to the source code and  rights to copy,
##modify and redistribute granted by the license, users are provided only
##with a limited warranty  and the software's author,  the holder of the
##economic rights,  and the successive licensors  have only  limited
##liability. 
##
##In this respect, the user's attention is drawn to the risks associated
##with loading,  using,  modifying and/or developing or reproducing the
##software by the user in light of its specific status of free software,
##that may mean  that it is complicated to manipulate,  and  that  also
##therefore means  that it is reserved for developers  and  experienced
##professionals having in-depth computer knowledge. Users are therefore
##encouraged to load and test the software's suitability as regards their
##requirements in conditions enabling the security of their systems and/or 
##data to be ensured and,  more generally, to use and operate it in the 
##same conditions as regards security. 
##
##The fact that you are presently reading this means that you have had
##knowledge of the CeCILL license and that you accept its terms.
*/
%{

// Headers necessary to define wrapped classes.

#include<AIS_AngleDimension.hxx>
#include<AIS_AttributeFilter.hxx>
#include<AIS_Axis.hxx>
#include<AIS_BadEdgeFilter.hxx>
#include<AIS_C0RegularityFilter.hxx>
#include<AIS_Chamf2dDimension.hxx>
#include<AIS_Chamf3dDimension.hxx>
#include<AIS_Circle.hxx>
#include<AIS_ClearMode.hxx>
#include<AIS_ConcentricRelation.hxx>
#include<AIS_ConnectedInteractive.hxx>
#include<AIS_ConnectedShape.hxx>
#include<AIS_ConnectStatus.hxx>
#include<AIS_DataMapIteratorOfDataMapOfILC.hxx>
#include<AIS_DataMapIteratorOfDataMapofIntegerListOfinteractive.hxx>
#include<AIS_DataMapIteratorOfDataMapOfIOStatus.hxx>
#include<AIS_DataMapIteratorOfDataMapOfSelStat.hxx>
#include<AIS_DataMapIteratorOfDataMapOfTransientTransient.hxx>
#include<AIS_DataMapNodeOfDataMapOfILC.hxx>
#include<AIS_DataMapNodeOfDataMapofIntegerListOfinteractive.hxx>
#include<AIS_DataMapNodeOfDataMapOfIOStatus.hxx>
#include<AIS_DataMapNodeOfDataMapOfSelStat.hxx>
#include<AIS_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include<AIS_DataMapOfILC.hxx>
#include<AIS_DataMapofIntegerListOfinteractive.hxx>
#include<AIS_DataMapOfIOStatus.hxx>
#include<AIS_DataMapOfSelStat.hxx>
#include<AIS_DataMapOfTransientTransient.hxx>
#include<AIS_DiameterDimension.hxx>
#include<AIS_DimensionOwner.hxx>
#include<AIS_DisplayMode.hxx>
#include<AIS_DisplayStatus.hxx>
#include<AIS_Drawer.hxx>
#include<AIS_EllipseRadiusDimension.hxx>
#include<AIS_EqualDistanceRelation.hxx>
#include<AIS_EqualRadiusRelation.hxx>
#include<AIS_ExclusionFilter.hxx>
#include<AIS_FixRelation.hxx>
#include<AIS_GlobalStatus.hxx>
#include<AIS_GraphicTool.hxx>
#include<AIS_IdenticRelation.hxx>
#include<AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs.hxx>
#include<AIS_IndexedDataMapOfOwnerPrs.hxx>
#include<AIS_InteractiveContext.hxx>
#include<AIS_InteractiveObject.hxx>
#include<AIS_KindOfDimension.hxx>
#include<AIS_KindOfInteractive.hxx>
#include<AIS_KindOfSurface.hxx>
#include<AIS_KindOfUnit.hxx>
#include<AIS_LengthDimension.hxx>
#include<AIS_Line.hxx>
#include<AIS_ListIteratorOfListOfInteractive.hxx>
#include<AIS_ListNodeOfListOfInteractive.hxx>
#include<AIS_ListOfInteractive.hxx>
#include<AIS_LocalContext.hxx>
#include<AIS_LocalStatus.hxx>
#include<AIS_MapIteratorOfMapOfInteractive.hxx>
#include<AIS_MapOfInteractive.hxx>
#include<AIS_MaxRadiusDimension.hxx>
#include<AIS_MidPointRelation.hxx>
#include<AIS_MinRadiusDimension.hxx>
#include<AIS_MultipleConnectedInteractive.hxx>
#include<AIS_MultipleConnectedShape.hxx>
#include<AIS_NDataMapOfTransientIteratorOfListTransient.hxx>
#include<AIS_NListIteratorOfListTransient.hxx>
#include<AIS_NListTransient.hxx>
#include<AIS_OffsetDimension.hxx>
#include<AIS_ParallelRelation.hxx>
#include<AIS_PerpendicularRelation.hxx>
#include<AIS_Plane.hxx>
#include<AIS_PlaneTrihedron.hxx>
#include<AIS_Point.hxx>
#include<AIS_PToContext.hxx>
#include<AIS_RadiusDimension.hxx>
#include<AIS_Relation.hxx>
#include<AIS_Selection.hxx>
#include<AIS_SelectStatus.hxx>
#include<AIS_SequenceNodeOfSequenceOfDimension.hxx>
#include<AIS_SequenceNodeOfSequenceOfInteractive.hxx>
#include<AIS_SequenceOfDimension.hxx>
#include<AIS_SequenceOfInteractive.hxx>
#include<AIS_Shape.hxx>
#include<AIS_SignatureFilter.hxx>
#include<AIS_StandardDatum.hxx>
#include<AIS_StatusOfDetection.hxx>
#include<AIS_StatusOfPick.hxx>
#include<AIS_StdMapNodeOfMapOfInteractive.hxx>
#include<AIS_SymmetricRelation.hxx>
#include<AIS_TangentRelation.hxx>
#include<AIS_TexturedShape.hxx>
#include<AIS_Trihedron.hxx>
#include<AIS_TypeFilter.hxx>
#include<AIS_TypeOfAttribute.hxx>
#include<AIS_TypeOfAxis.hxx>
#include<AIS_TypeOfDist.hxx>
#include<AIS_TypeOfIso.hxx>
#include<AIS_TypeOfPlane.hxx>
#include<AIS.hxx>
#include<Handle_AIS_AngleDimension.hxx>
#include<Handle_AIS_AttributeFilter.hxx>
#include<Handle_AIS_Axis.hxx>
#include<Handle_AIS_BadEdgeFilter.hxx>
#include<Handle_AIS_C0RegularityFilter.hxx>
#include<Handle_AIS_Chamf2dDimension.hxx>
#include<Handle_AIS_Chamf3dDimension.hxx>
#include<Handle_AIS_Circle.hxx>
#include<Handle_AIS_ConcentricRelation.hxx>
#include<Handle_AIS_ConnectedInteractive.hxx>
#include<Handle_AIS_ConnectedShape.hxx>
#include<Handle_AIS_DataMapNodeOfDataMapOfILC.hxx>
#include<Handle_AIS_DataMapNodeOfDataMapofIntegerListOfinteractive.hxx>
#include<Handle_AIS_DataMapNodeOfDataMapOfIOStatus.hxx>
#include<Handle_AIS_DataMapNodeOfDataMapOfSelStat.hxx>
#include<Handle_AIS_DataMapNodeOfDataMapOfTransientTransient.hxx>
#include<Handle_AIS_DiameterDimension.hxx>
#include<Handle_AIS_DimensionOwner.hxx>
#include<Handle_AIS_Drawer.hxx>
#include<Handle_AIS_EllipseRadiusDimension.hxx>
#include<Handle_AIS_EqualDistanceRelation.hxx>
#include<Handle_AIS_EqualRadiusRelation.hxx>
#include<Handle_AIS_ExclusionFilter.hxx>
#include<Handle_AIS_FixRelation.hxx>
#include<Handle_AIS_GlobalStatus.hxx>
#include<Handle_AIS_IdenticRelation.hxx>
#include<Handle_AIS_IndexedDataMapNodeOfIndexedDataMapOfOwnerPrs.hxx>
#include<Handle_AIS_InteractiveContext.hxx>
#include<Handle_AIS_InteractiveObject.hxx>
#include<Handle_AIS_LengthDimension.hxx>
#include<Handle_AIS_Line.hxx>
#include<Handle_AIS_ListNodeOfListOfInteractive.hxx>
#include<Handle_AIS_LocalContext.hxx>
#include<Handle_AIS_LocalStatus.hxx>
#include<Handle_AIS_MaxRadiusDimension.hxx>
#include<Handle_AIS_MidPointRelation.hxx>
#include<Handle_AIS_MinRadiusDimension.hxx>
#include<Handle_AIS_MultipleConnectedInteractive.hxx>
#include<Handle_AIS_MultipleConnectedShape.hxx>
#include<Handle_AIS_OffsetDimension.hxx>
#include<Handle_AIS_ParallelRelation.hxx>
#include<Handle_AIS_PerpendicularRelation.hxx>
#include<Handle_AIS_Plane.hxx>
#include<Handle_AIS_PlaneTrihedron.hxx>
#include<Handle_AIS_Point.hxx>
#include<Handle_AIS_RadiusDimension.hxx>
#include<Handle_AIS_Relation.hxx>
#include<Handle_AIS_Selection.hxx>
#include<Handle_AIS_SequenceNodeOfSequenceOfDimension.hxx>
#include<Handle_AIS_SequenceNodeOfSequenceOfInteractive.hxx>
#include<Handle_AIS_Shape.hxx>
#include<Handle_AIS_SignatureFilter.hxx>
#include<Handle_AIS_StdMapNodeOfMapOfInteractive.hxx>
#include<Handle_AIS_SymmetricRelation.hxx>
#include<Handle_AIS_TangentRelation.hxx>
#include<Handle_AIS_TexturedShape.hxx>
#include<Handle_AIS_Trihedron.hxx>
#include<Handle_AIS_TypeFilter.hxx>

// Additional headers necessary for compilation.

#include<Graphic3d_Array1OfBytes.hxx>
#include<Graphic3d_Array1OfVector.hxx>
#include<Graphic3d_Array1OfVertex.hxx>
#include<Graphic3d_Array1OfVertexC.hxx>
#include<Graphic3d_Array1OfVertexN.hxx>
#include<Graphic3d_Array1OfVertexNC.hxx>
#include<Graphic3d_Array1OfVertexNT.hxx>
#include<Graphic3d_Array2OfVertex.hxx>
#include<Graphic3d_Array2OfVertexC.hxx>
#include<Graphic3d_Array2OfVertexN.hxx>
#include<Graphic3d_Array2OfVertexNC.hxx>
#include<Graphic3d_Array2OfVertexNT.hxx>
#include<Graphic3d_ArrayOfPoints.hxx>
#include<Graphic3d_ArrayOfPolygons.hxx>
#include<Graphic3d_ArrayOfPolylines.hxx>
#include<Graphic3d_ArrayOfPrimitives.hxx>
#include<Graphic3d_ArrayOfQuadrangles.hxx>
#include<Graphic3d_ArrayOfQuadrangleStrips.hxx>
#include<Graphic3d_ArrayOfSegments.hxx>
#include<Graphic3d_ArrayOfTriangleFans.hxx>
#include<Graphic3d_ArrayOfTriangles.hxx>
#include<Graphic3d_ArrayOfTriangleStrips.hxx>
#include<Graphic3d_AspectFillArea3d.hxx>
#include<Graphic3d_AspectLine3d.hxx>
#include<Graphic3d_AspectMarker3d.hxx>
#include<Graphic3d_AspectText3d.hxx>
#include<Graphic3d_AspectTextDefinitionError.hxx>
#include<Graphic3d_CBitFields16.hxx>
#include<Graphic3d_CBitFields20.hxx>
#include<Graphic3d_CBitFields4.hxx>
#include<Graphic3d_CBitFields8.hxx>
#include<Graphic3d_CBounds.hxx>
#include<Graphic3d_CGroup.hxx>
#include<Graphic3d_CInitTexture.hxx>
#include<Graphic3d_CLight.hxx>
#include<Graphic3d_CPick.hxx>
#include<Graphic3d_CPlane.hxx>
#include<Graphic3d_CStructure.hxx>
#include<Graphic3d_CTexture.hxx>
#include<Graphic3d_CTransPersStruct.hxx>
#include<Graphic3d_CUserDraw.hxx>
#include<Graphic3d_CView.hxx>
#include<Graphic3d_CycleError.hxx>
#include<Graphic3d_DataStructureManager.hxx>
#include<Graphic3d_ExportFormat.hxx>
#include<Graphic3d_GraphicDevice.hxx>
#include<Graphic3d_GraphicDriver.hxx>
#include<Graphic3d_Group.hxx>
#include<Graphic3d_GroupDefinitionError.hxx>
#include<Graphic3d_HArray1OfBytes.hxx>
#include<Graphic3d_HorizontalTextAlignment.hxx>
#include<Graphic3d_HSequenceOfGroup.hxx>
#include<Graphic3d_HSequenceOfStructure.hxx>
#include<Graphic3d_HSetOfGroup.hxx>
#include<Graphic3d_InitialisationError.hxx>
#include<Graphic3d_ListIteratorOfListOfPArray.hxx>
#include<Graphic3d_ListIteratorOfListOfShortReal.hxx>
#include<Graphic3d_ListIteratorOfSetListOfSetOfGroup.hxx>
#include<Graphic3d_ListNodeOfListOfPArray.hxx>
#include<Graphic3d_ListNodeOfListOfShortReal.hxx>
#include<Graphic3d_ListNodeOfSetListOfSetOfGroup.hxx>
#include<Graphic3d_ListOfPArray.hxx>
#include<Graphic3d_ListOfShortReal.hxx>
#include<Graphic3d_MapIteratorOfMapOfStructure.hxx>
#include<Graphic3d_MapOfStructure.hxx>
#include<Graphic3d_MaterialAspect.hxx>
#include<Graphic3d_MaterialDefinitionError.hxx>
#include<Graphic3d_NameOfFont.hxx>
#include<Graphic3d_NameOfMaterial.hxx>
#include<Graphic3d_NameOfTexture1D.hxx>
#include<Graphic3d_NameOfTexture2D.hxx>
#include<Graphic3d_NameOfTextureEnv.hxx>
#include<Graphic3d_NameOfTexturePlane.hxx>
#include<Graphic3d_PickIdDefinitionError.hxx>
#include<Graphic3d_Plotter.hxx>
#include<Graphic3d_PlotterDefinitionError.hxx>
#include<Graphic3d_PrimitiveArray.hxx>
#include<Graphic3d_PriorityDefinitionError.hxx>
#include<Graphic3d_SequenceNodeOfSequenceOfAddress.hxx>
#include<Graphic3d_SequenceNodeOfSequenceOfGroup.hxx>
#include<Graphic3d_SequenceNodeOfSequenceOfStructure.hxx>
#include<Graphic3d_SequenceOfAddress.hxx>
#include<Graphic3d_SequenceOfGroup.hxx>
#include<Graphic3d_SequenceOfStructure.hxx>
#include<Graphic3d_SetIteratorOfSetOfGroup.hxx>
#include<Graphic3d_SetListOfSetOfGroup.hxx>
#include<Graphic3d_SetOfGroup.hxx>
#include<Graphic3d_SortType.hxx>
#include<Graphic3d_StdMapNodeOfMapOfStructure.hxx>
#include<Graphic3d_Strips.hxx>
#include<Graphic3d_StructPtr.hxx>
#include<Graphic3d_Structure.hxx>
#include<Graphic3d_StructureDefinitionError.hxx>
#include<Graphic3d_StructureManager.hxx>
#include<Graphic3d_TextPath.hxx>
#include<Graphic3d_Texture1D.hxx>
#include<Graphic3d_Texture1Dmanual.hxx>
#include<Graphic3d_Texture1Dsegment.hxx>
#include<Graphic3d_Texture2D.hxx>
#include<Graphic3d_Texture2Dmanual.hxx>
#include<Graphic3d_Texture2Dplane.hxx>
#include<Graphic3d_TextureEnv.hxx>
#include<Graphic3d_TextureMap.hxx>
#include<Graphic3d_TextureRoot.hxx>
#include<Graphic3d_TransformError.hxx>
#include<Graphic3d_TransModeFlags.hxx>
#include<Graphic3d_TypeOfComposition.hxx>
#include<Graphic3d_TypeOfConnection.hxx>
#include<Graphic3d_TypeOfMaterial.hxx>
#include<Graphic3d_TypeOfPolygon.hxx>
#include<Graphic3d_TypeOfPrimitive.hxx>
#include<Graphic3d_TypeOfPrimitiveArray.hxx>
#include<Graphic3d_TypeOfReflection.hxx>
#include<Graphic3d_TypeOfStructure.hxx>
#include<Graphic3d_TypeOfTexture.hxx>
#include<Graphic3d_TypeOfTextureMode.hxx>
#include<Graphic3d_Vector.hxx>
#include<Graphic3d_VectorError.hxx>
#include<Graphic3d_Vertex.hxx>
#include<Graphic3d_VertexC.hxx>
#include<Graphic3d_VertexN.hxx>
#include<Graphic3d_VertexNC.hxx>
#include<Graphic3d_VertexNT.hxx>
#include<Graphic3d_VerticalTextAlignment.hxx>
#include<Graphic3d_WNTGraphicDevice.hxx>
#include<TopoDS_Vertex.hxx>
#include<Aspect.hxx>
#include<Aspect_Array1OfEdge.hxx>
#include<Aspect_AspectFillArea.hxx>
#include<Aspect_AspectFillAreaDefinitionError.hxx>
#include<Aspect_AspectLine.hxx>
#include<Aspect_AspectLineDefinitionError.hxx>
#include<Aspect_AspectMarker.hxx>
#include<Aspect_AspectMarkerDefinitionError.hxx>
#include<Aspect_Background.hxx>
#include<Aspect_BadAccess.hxx>
#include<Aspect_CardinalPoints.hxx>
#include<Aspect_CircularGrid.hxx>
#include<Aspect_CLayer2d.hxx>
#include<Aspect_ColorCubeColorMap.hxx>
#include<Aspect_ColorMap.hxx>
#include<Aspect_ColorMapDefinitionError.hxx>
#include<Aspect_ColorMapEntry.hxx>
#include<Aspect_ColorPixel.hxx>
#include<Aspect_ColorRampColorMap.hxx>
#include<Aspect_ColorScale.hxx>
#include<Aspect_Display.hxx>
#include<Aspect_Drawable.hxx>
#include<Aspect_Driver.hxx>
#include<Aspect_DriverDefinitionError.hxx>
#include<Aspect_DriverError.hxx>
#include<Aspect_DriverPtr.hxx>
#include<Aspect_Edge.hxx>
#include<Aspect_EdgeDefinitionError.hxx>
#include<Aspect_FillMethod.hxx>
#include<Aspect_FontMap.hxx>
#include<Aspect_FontMapDefinitionError.hxx>
#include<Aspect_FontMapEntry.hxx>
#include<Aspect_FontStyle.hxx>
#include<Aspect_FontStyleDefinitionError.hxx>
#include<Aspect_FormatOfSheetPaper.hxx>
#include<Aspect_FStream.hxx>
#include<Aspect_GenericColorMap.hxx>
#include<Aspect_GenId.hxx>
#include<Aspect_GraphicCallbackProc.hxx>
#include<Aspect_GraphicDevice.hxx>
#include<Aspect_GraphicDeviceDefinitionError.hxx>
#include<Aspect_GraphicDriver.hxx>
#include<Aspect_Grid.hxx>
#include<Aspect_GridDrawMode.hxx>
#include<Aspect_GridType.hxx>
#include<Aspect_Handle.hxx>
#include<Aspect_HatchStyle.hxx>
#include<Aspect_IdentDefinitionError.hxx>
#include<Aspect_IFStream.hxx>
#include<Aspect_IndexPixel.hxx>
#include<Aspect_InteriorStyle.hxx>
#include<Aspect_LineStyle.hxx>
#include<Aspect_LineStyleDefinitionError.hxx>
#include<Aspect_LineWidthDefinitionError.hxx>
#include<Aspect_ListingType.hxx>
#include<Aspect_MarkerStyle.hxx>
#include<Aspect_MarkerStyleDefinitionError.hxx>
#include<Aspect_MarkMap.hxx>
#include<Aspect_MarkMapDefinitionError.hxx>
#include<Aspect_MarkMapEntry.hxx>
#include<Aspect_Pixel.hxx>
#include<Aspect_PixMap.hxx>
#include<Aspect_PixmapDefinitionError.hxx>
#include<Aspect_PixmapError.hxx>
#include<Aspect_PlotMode.hxx>
#include<Aspect_PlotterOrigin.hxx>
#include<Aspect_PolygonOffsetMode.hxx>
#include<Aspect_PolyStyleDefinitionError.hxx>
#include<Aspect_RectangularGrid.hxx>
#include<Aspect_RenderingContext.hxx>
#include<Aspect_RGBPixel.hxx>
#include<Aspect_SequenceNodeOfSequenceOfColor.hxx>
#include<Aspect_SequenceNodeOfSequenceOfColorMapEntry.hxx>
#include<Aspect_SequenceNodeOfSequenceOfFontMapEntry.hxx>
#include<Aspect_SequenceNodeOfSequenceOfMarkMapEntry.hxx>
#include<Aspect_SequenceNodeOfSequenceOfTypeMapEntry.hxx>
#include<Aspect_SequenceNodeOfSequenceOfWidthMapEntry.hxx>
#include<Aspect_SequenceOfColor.hxx>
#include<Aspect_SequenceOfColorMapEntry.hxx>
#include<Aspect_SequenceOfFontMapEntry.hxx>
#include<Aspect_SequenceOfMarkMapEntry.hxx>
#include<Aspect_SequenceOfTypeMapEntry.hxx>
#include<Aspect_SequenceOfWidthMapEntry.hxx>
#include<Aspect_TypeMap.hxx>
#include<Aspect_TypeMapDefinitionError.hxx>
#include<Aspect_TypeMapEntry.hxx>
#include<Aspect_TypeOfColorMap.hxx>
#include<Aspect_TypeOfColorScaleData.hxx>
#include<Aspect_TypeOfColorScaleOrientation.hxx>
#include<Aspect_TypeOfColorScalePosition.hxx>
#include<Aspect_TypeOfColorSpace.hxx>
#include<Aspect_TypeOfConstraint.hxx>
#include<Aspect_TypeOfDeflection.hxx>
#include<Aspect_TypeOfDegenerateModel.hxx>
#include<Aspect_TypeOfDisplayText.hxx>
#include<Aspect_TypeOfDrawMode.hxx>
#include<Aspect_TypeOfEdge.hxx>
#include<Aspect_TypeOfFacingModel.hxx>
#include<Aspect_TypeOfFont.hxx>
#include<Aspect_TypeOfHighlightMethod.hxx>
#include<Aspect_TypeOfLayer.hxx>
#include<Aspect_TypeOfLine.hxx>
#include<Aspect_TypeOfMarker.hxx>
#include<Aspect_TypeOfPrimitive.hxx>
#include<Aspect_TypeOfRenderingMode.hxx>
#include<Aspect_TypeOfResize.hxx>
#include<Aspect_TypeOfStyleText.hxx>
#include<Aspect_TypeOfText.hxx>
#include<Aspect_TypeOfTriedronEcho.hxx>
#include<Aspect_TypeOfTriedronPosition.hxx>
#include<Aspect_TypeOfUpdate.hxx>
#include<Aspect_UndefinedMap.hxx>
#include<Aspect_Units.hxx>
#include<Aspect_WidthMap.hxx>
#include<Aspect_WidthMapDefinitionError.hxx>
#include<Aspect_WidthMapEntry.hxx>
#include<Aspect_WidthOfLine.hxx>
#include<Aspect_Window.hxx>
#include<Aspect_WindowDefinitionError.hxx>
#include<Aspect_WindowDriver.hxx>
#include<Aspect_WindowDriverPtr.hxx>
#include<Aspect_WindowError.hxx>
#include<SelectBasics.hxx>
#include<SelectBasics_BasicTool.hxx>
#include<SelectBasics_EntityOwner.hxx>
#include<SelectBasics_ListIteratorOfListOfBox2d.hxx>
#include<SelectBasics_ListIteratorOfListOfSensitive.hxx>
#include<SelectBasics_ListNodeOfListOfBox2d.hxx>
#include<SelectBasics_ListNodeOfListOfSensitive.hxx>
#include<SelectBasics_ListOfBox2d.hxx>
#include<SelectBasics_ListOfSensitive.hxx>
#include<SelectBasics_SensitiveEntity.hxx>
#include<SelectBasics_SequenceNodeOfSequenceOfAddress.hxx>
#include<SelectBasics_SequenceNodeOfSequenceOfOwner.hxx>
#include<SelectBasics_SequenceOfAddress.hxx>
#include<SelectBasics_SequenceOfOwner.hxx>
#include<SelectBasics_SortAlgo.hxx>
#include<PrsMgr_KindOfPrs.hxx>
#include<PrsMgr_ModedPresentation.hxx>
#include<PrsMgr_PresentableObject.hxx>
#include<PrsMgr_PresentableObjectPointer.hxx>
#include<PrsMgr_Presentation.hxx>
#include<PrsMgr_Presentation2d.hxx>
#include<PrsMgr_Presentation3d.hxx>
#include<PrsMgr_Presentation3dPointer.hxx>
#include<PrsMgr_PresentationManager.hxx>
#include<PrsMgr_PresentationManager2d.hxx>
#include<PrsMgr_PresentationManager3d.hxx>
#include<PrsMgr_Presentations.hxx>
#include<PrsMgr_Prs.hxx>
#include<PrsMgr_SequenceNodeOfPresentations.hxx>
#include<PrsMgr_TypeOfPresentation3d.hxx>

// Needed headers necessary for compilation.

#include<Handle_Standard_Transient.hxx>
#include<Handle_Prs3d_IsoAspect.hxx>
#include<Handle_Prs3d_LineAspect.hxx>
#include<Handle_Prs3d_TextAspect.hxx>
#include<Handle_Prs3d_ArrowAspect.hxx>
#include<Handle_Prs3d_PointAspect.hxx>
#include<Handle_Prs3d_ShadingAspect.hxx>
#include<Handle_Prs3d_PlaneAspect.hxx>
#include<Handle_Prs3d_DatumAspect.hxx>
#include<Handle_Prs3d_LengthAspect.hxx>
#include<Handle_Prs3d_AngleAspect.hxx>
#include<Handle_Prs3d_RadiusAspect.hxx>
#include<Handle_Prs3d_Drawer.hxx>
#include<Quantity_Color.hxx>
#include<Graphic3d_MaterialAspect.hxx>
#include<Handle_Geom_Transformation.hxx>
#include<Handle_Prs3d_Presentation.hxx>
#include<Handle_Prs3d_BasicAspect.hxx>
#include<TopoDS_Shape.hxx>
#include<Handle_Geom_Plane.hxx>
#include<gp_Pnt.hxx>
#include<TCollection_ExtendedString.hxx>
#include<Handle_Prs3d_Projector.hxx>
#include<TCollection_AsciiString.hxx>
#include<Handle_SelectMgr_SelectableObject.hxx>
#include<Handle_SelectMgr_EntityOwner.hxx>
#include<TColStd_ListOfInteger.hxx>
#include<Handle_Geom_Line.hxx>
#include<Handle_Geom_Point.hxx>
#include<gp_Trsf.hxx>
#include<TopLoc_Location.hxx>
#include<Handle_PrsMgr_PresentationManager2d.hxx>
#include<Handle_Graphic2d_GraphicObject.hxx>
#include<Handle_SelectMgr_Selection.hxx>
#include<TopoDS_Edge.hxx>
#include<Handle_Geom_Circle.hxx>
#include<Handle_Geom_Axis2Placement.hxx>
#include<Handle_Geom_Axis1Placement.hxx>
#include<TopoDS_Wire.hxx>
#include<TColgp_Array1OfPnt.hxx>
#include<Handle_V3d_Viewer.hxx>
#include<Handle_V3d_View.hxx>
#include<TColgp_Array1OfPnt2d.hxx>
#include<SelectMgr_IndexedMapOfOwner.hxx>
#include<Handle_SelectMgr_Filter.hxx>
#include<Handle_StdSelect_ViewerSelector3d.hxx>
#include<Handle_Geom_Curve.hxx>
#include<TopoDS_Vertex.hxx>
#include<TopoDS_Face.hxx>
#include<gp_Pln.hxx>
#include<Handle_Geom_Surface.hxx>
#include<gp_Dir.hxx>
#include<gp_Ax1.hxx>
#include<gp_Lin.hxx>
#include<Bnd_Box.hxx>
#include<gp_Elips.hxx>
#include<Handle_PrsMgr_PresentationManager3d.hxx>
#include<Select3D_Projector.hxx>
#include<TColStd_MapOfTransient.hxx>
%}
