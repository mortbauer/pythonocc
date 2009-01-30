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
#include <Handle_TCollection_AVLBaseNode.hxx>
#include <Handle_TCollection_HAsciiString.hxx>
#include <Handle_TCollection_HExtendedString.hxx>
#include <Handle_TCollection_MapNode.hxx>
#include <Handle_TCollection_SeqNode.hxx>
#include <STEPControl_ActorRead.hxx>
#include <STEPControl_ActorWrite.hxx>
#include <STEPControl_Controller.hxx>
#include <STEPControl_Reader.hxx>
#include <STEPControl_StepModelType.hxx>
#include <STEPControl_Writer.hxx>
#include <Handle_STEPControl_ActorRead.hxx>
#include <Handle_STEPControl_ActorWrite.hxx>
#include <Handle_STEPControl_Controller.hxx>
#include <MMgt_StackManager.hxx>
#include <MMgt_TShared.hxx>
#include <Handle_MMgt_TShared.hxx>
#include <Standard_AbortiveTransaction.hxx>
#include <Standard_Address.hxx>
#include <Standard_AncestorIterator.hxx>
#include <Standard_Boolean.hxx>
#include <Standard_Byte.hxx>
#include <Standard_Character.hxx>
#include <Standard_ConstructionError.hxx>
#include <Standard_CString.hxx>
#include <Standard_ctype.hxx>
#include <Standard_DefineHandle.hxx>
#include <Standard_DimensionError.hxx>
#include <Standard_DimensionMismatch.hxx>
#include <Standard_DivideByZero.hxx>
#include <Standard_DomainError.hxx>
#include <Standard_ErrorHandler.hxx>
#include <Standard_ErrorHandlerCallback.hxx>
#include <Standard_ExtCharacter.hxx>
#include <Standard_ExtString.hxx>
#include <Standard_Failure.hxx>
#include <Standard_GUID.hxx>
#include <Standard_HandlerStatus.hxx>
#include <Standard_ImmutableObject.hxx>
#include <Standard_Integer.hxx>
#include <Standard_InternalType.hxx>
#include <Standard_IStream.hxx>
#include <Standard_JmpBuf.hxx>
#include <Standard_KindOfType.hxx>
#include <Standard_LicenseError.hxx>
#include <Standard_LicenseNotFound.hxx>
#include <Standard_Macro.hxx>
#include <Standard_math.hxx>
#include <Standard_MMgrOpt.hxx>
#include <Standard_MMgrRaw.hxx>
#include <Standard_MMgrRoot.hxx>
#include <Standard_MultiplyDefined.hxx>
#include <Standard_Mutex.hxx>
#include <Standard_NegativeValue.hxx>
#include <Standard_NoMoreObject.hxx>
#include <Standard_NoSuchObject.hxx>
#include <Standard_NotImplemented.hxx>
#include <Standard_NullObject.hxx>
#include <Standard_NullValue.hxx>
#include <Standard_NumericError.hxx>
#include <Standard_OId.hxx>
#include <Standard_OStream.hxx>
#include <Standard_OutOfMemory.hxx>
#include <Standard_OutOfRange.hxx>
#include <Standard_Overflow.hxx>
#include <Standard_PCharacter.hxx>
#include <Standard_PErrorHandler.hxx>
#include <Standard_Persistent.hxx>
#include <Standard_Persistent_proto.hxx>
#include <Standard_PExtCharacter.hxx>
#include <Standard_PrimitiveTypes.hxx>
#include <Standard_ProgramError.hxx>
#include <Standard_RangeError.hxx>
#include <Standard_Real.hxx>
#include <Standard_ShortReal.hxx>
#include <Standard_Size.hxx>
#include <Standard_SStream.hxx>
#include <Standard_Static.hxx>
#include <Standard_Storable.hxx>
#include <Standard_Stream.hxx>
#include <Standard_String.hxx>
#include <Standard_ThreadId.hxx>
#include <Standard_TooManyUsers.hxx>
#include <Standard_Transient.hxx>
#include <Standard_Type.hxx>
#include <Standard_TypeDef.hxx>
#include <Standard_TypeMismatch.hxx>
#include <Standard_Underflow.hxx>
#include <Standard_UUID.hxx>
#include <Standard_Version.hxx>
#include <Standard_WayOfLife.hxx>
#include <Handle_Standard_AbortiveTransaction.hxx>
#include <Handle_Standard_ConstructionError.hxx>
#include <Handle_Standard_DimensionError.hxx>
#include <Handle_Standard_DimensionMismatch.hxx>
#include <Handle_Standard_DivideByZero.hxx>
#include <Handle_Standard_DomainError.hxx>
#include <Handle_Standard_Failure.hxx>
#include <Handle_Standard_ImmutableObject.hxx>
#include <Handle_Standard_LicenseError.hxx>
#include <Handle_Standard_LicenseNotFound.hxx>
#include <Handle_Standard_MultiplyDefined.hxx>
#include <Handle_Standard_NegativeValue.hxx>
#include <Handle_Standard_NoMoreObject.hxx>
#include <Handle_Standard_NoSuchObject.hxx>
#include <Handle_Standard_NotImplemented.hxx>
#include <Handle_Standard_NullObject.hxx>
#include <Handle_Standard_NullValue.hxx>
#include <Handle_Standard_NumericError.hxx>
#include <Handle_Standard_OutOfMemory.hxx>
#include <Handle_Standard_OutOfRange.hxx>
#include <Handle_Standard_Overflow.hxx>
#include <Handle_Standard_Persistent.hxx>
#include <Handle_Standard_ProgramError.hxx>
#include <Handle_Standard_RangeError.hxx>
#include <Handle_Standard_TooManyUsers.hxx>
#include <Handle_Standard_Transient.hxx>
#include <Handle_Standard_Type.hxx>
#include <Handle_Standard_TypeMismatch.hxx>
#include <Handle_Standard_Underflow.hxx>
#include <IFSelect_Act.hxx>
#include <IFSelect_ActFunc.hxx>
#include <IFSelect_Activator.hxx>
#include <IFSelect_AppliedModifiers.hxx>
#include <IFSelect_BasicDumper.hxx>
#include <IFSelect_CheckCounter.hxx>
#include <IFSelect_ContextModif.hxx>
#include <IFSelect_ContextWrite.hxx>
#include <IFSelect_Dispatch.hxx>
#include <IFSelect_DispGlobal.hxx>
#include <IFSelect_DispPerCount.hxx>
#include <IFSelect_DispPerFiles.hxx>
#include <IFSelect_DispPerOne.hxx>
#include <IFSelect_DispPerSignature.hxx>
#include <IFSelect_EditForm.hxx>
#include <IFSelect_Editor.hxx>
#include <IFSelect_EditValue.hxx>
#include <IFSelect_Functions.hxx>
#include <IFSelect_GeneralModifier.hxx>
#include <IFSelect_GraphCounter.hxx>
#include <IFSelect_HSeqOfSelection.hxx>
#include <IFSelect_IntParam.hxx>
#include <IFSelect_ListEditor.hxx>
#include <IFSelect_ModelCopier.hxx>
#include <IFSelect_ModifEditForm.hxx>
#include <IFSelect_Modifier.hxx>
#include <IFSelect_ModifReorder.hxx>
#include <IFSelect_Option.hxx>
#include <IFSelect_PacketList.hxx>
#include <IFSelect_ParamEditor.hxx>
#include <IFSelect_PrintCount.hxx>
#include <IFSelect_PrintFail.hxx>
#include <IFSelect_Profile.hxx>
#include <IFSelect_RemainMode.hxx>
#include <IFSelect_ReturnStatus.hxx>
#include <IFSelect_SelectAnyList.hxx>
#include <IFSelect_SelectAnyType.hxx>
#include <IFSelect_SelectBase.hxx>
#include <IFSelect_SelectCombine.hxx>
#include <IFSelect_SelectControl.hxx>
#include <IFSelect_SelectDeduct.hxx>
#include <IFSelect_SelectDiff.hxx>
#include <IFSelect_SelectEntityNumber.hxx>
#include <IFSelect_SelectErrorEntities.hxx>
#include <IFSelect_SelectExplore.hxx>
#include <IFSelect_SelectExtract.hxx>
#include <IFSelect_SelectFlag.hxx>
#include <IFSelect_SelectIncorrectEntities.hxx>
#include <IFSelect_SelectInList.hxx>
#include <IFSelect_SelectIntersection.hxx>
#include <IFSelect_Selection.hxx>
#include <IFSelect_SelectionIterator.hxx>
#include <IFSelect_SelectModelEntities.hxx>
#include <IFSelect_SelectModelRoots.hxx>
#include <IFSelect_SelectPointed.hxx>
#include <IFSelect_SelectRange.hxx>
#include <IFSelect_SelectRootComps.hxx>
#include <IFSelect_SelectRoots.hxx>
#include <IFSelect_SelectSent.hxx>
#include <IFSelect_SelectShared.hxx>
#include <IFSelect_SelectSharing.hxx>
#include <IFSelect_SelectSignature.hxx>
#include <IFSelect_SelectSignedShared.hxx>
#include <IFSelect_SelectSignedSharing.hxx>
#include <IFSelect_SelectSuite.hxx>
#include <IFSelect_SelectType.hxx>
#include <IFSelect_SelectUnion.hxx>
#include <IFSelect_SelectUnknownEntities.hxx>
#include <IFSelect_SequenceNodeOfSequenceOfAppliedModifiers.hxx>
#include <IFSelect_SequenceNodeOfSequenceOfGeneralModifier.hxx>
#include <IFSelect_SequenceNodeOfSequenceOfInterfaceModel.hxx>
#include <IFSelect_SequenceNodeOfTSeqOfDispatch.hxx>
#include <IFSelect_SequenceNodeOfTSeqOfSelection.hxx>
#include <IFSelect_SequenceOfAppliedModifiers.hxx>
#include <IFSelect_SequenceOfGeneralModifier.hxx>
#include <IFSelect_SequenceOfInterfaceModel.hxx>
#include <IFSelect_SessionDumper.hxx>
#include <IFSelect_SessionFile.hxx>
#include <IFSelect_SessionPilot.hxx>
#include <IFSelect_ShareOut.hxx>
#include <IFSelect_ShareOutResult.hxx>
#include <IFSelect_SignAncestor.hxx>
#include <IFSelect_Signature.hxx>
#include <IFSelect_SignatureList.hxx>
#include <IFSelect_SignCategory.hxx>
#include <IFSelect_SignCounter.hxx>
#include <IFSelect_SignMultiple.hxx>
#include <IFSelect_SignType.hxx>
#include <IFSelect_SignValidity.hxx>
#include <IFSelect_Transformer.hxx>
#include <IFSelect_TransformStandard.hxx>
#include <IFSelect_TSeqOfDispatch.hxx>
#include <IFSelect_TSeqOfSelection.hxx>
#include <IFSelect_WorkLibrary.hxx>
#include <IFSelect_WorkSession.hxx>
#include <Handle_IFSelect_Act.hxx>
#include <Handle_IFSelect_Activator.hxx>
#include <Handle_IFSelect_AppliedModifiers.hxx>
#include <Handle_IFSelect_BasicDumper.hxx>
#include <Handle_IFSelect_CheckCounter.hxx>
#include <Handle_IFSelect_Dispatch.hxx>
#include <Handle_IFSelect_DispGlobal.hxx>
#include <Handle_IFSelect_DispPerCount.hxx>
#include <Handle_IFSelect_DispPerFiles.hxx>
#include <Handle_IFSelect_DispPerOne.hxx>
#include <Handle_IFSelect_DispPerSignature.hxx>
#include <Handle_IFSelect_EditForm.hxx>
#include <Handle_IFSelect_Editor.hxx>
#include <Handle_IFSelect_GeneralModifier.hxx>
#include <Handle_IFSelect_GraphCounter.hxx>
#include <Handle_IFSelect_HSeqOfSelection.hxx>
#include <Handle_IFSelect_IntParam.hxx>
#include <Handle_IFSelect_ListEditor.hxx>
#include <Handle_IFSelect_ModelCopier.hxx>
#include <Handle_IFSelect_ModifEditForm.hxx>
#include <Handle_IFSelect_Modifier.hxx>
#include <Handle_IFSelect_ModifReorder.hxx>
#include <Handle_IFSelect_PacketList.hxx>
#include <Handle_IFSelect_ParamEditor.hxx>
#include <Handle_IFSelect_SelectAnyList.hxx>
#include <Handle_IFSelect_SelectAnyType.hxx>
#include <Handle_IFSelect_SelectBase.hxx>
#include <Handle_IFSelect_SelectCombine.hxx>
#include <Handle_IFSelect_SelectControl.hxx>
#include <Handle_IFSelect_SelectDeduct.hxx>
#include <Handle_IFSelect_SelectDiff.hxx>
#include <Handle_IFSelect_SelectEntityNumber.hxx>
#include <Handle_IFSelect_SelectErrorEntities.hxx>
#include <Handle_IFSelect_SelectExplore.hxx>
#include <Handle_IFSelect_SelectExtract.hxx>
#include <Handle_IFSelect_SelectFlag.hxx>
#include <Handle_IFSelect_SelectIncorrectEntities.hxx>
#include <Handle_IFSelect_SelectInList.hxx>
#include <Handle_IFSelect_SelectIntersection.hxx>
#include <Handle_IFSelect_Selection.hxx>
#include <Handle_IFSelect_SelectModelEntities.hxx>
#include <Handle_IFSelect_SelectModelRoots.hxx>
#include <Handle_IFSelect_SelectPointed.hxx>
#include <Handle_IFSelect_SelectRange.hxx>
#include <Handle_IFSelect_SelectRootComps.hxx>
#include <Handle_IFSelect_SelectRoots.hxx>
#include <Handle_IFSelect_SelectSent.hxx>
#include <Handle_IFSelect_SelectShared.hxx>
#include <Handle_IFSelect_SelectSharing.hxx>
#include <Handle_IFSelect_SelectSignature.hxx>
#include <Handle_IFSelect_SelectSignedShared.hxx>
#include <Handle_IFSelect_SelectSignedSharing.hxx>
#include <Handle_IFSelect_SelectSuite.hxx>
#include <Handle_IFSelect_SelectType.hxx>
#include <Handle_IFSelect_SelectUnion.hxx>
#include <Handle_IFSelect_SelectUnknownEntities.hxx>
#include <Handle_IFSelect_SequenceNodeOfSequenceOfAppliedModifiers.hxx>
#include <Handle_IFSelect_SequenceNodeOfSequenceOfGeneralModifier.hxx>
#include <Handle_IFSelect_SequenceNodeOfSequenceOfInterfaceModel.hxx>
#include <Handle_IFSelect_SequenceNodeOfTSeqOfDispatch.hxx>
#include <Handle_IFSelect_SequenceNodeOfTSeqOfSelection.hxx>
#include <Handle_IFSelect_SessionDumper.hxx>
#include <Handle_IFSelect_SessionPilot.hxx>
#include <Handle_IFSelect_ShareOut.hxx>
#include <Handle_IFSelect_SignAncestor.hxx>
#include <Handle_IFSelect_Signature.hxx>
#include <Handle_IFSelect_SignatureList.hxx>
#include <Handle_IFSelect_SignCategory.hxx>
#include <Handle_IFSelect_SignCounter.hxx>
#include <Handle_IFSelect_SignMultiple.hxx>
#include <Handle_IFSelect_SignType.hxx>
#include <Handle_IFSelect_SignValidity.hxx>
#include <Handle_IFSelect_Transformer.hxx>
#include <Handle_IFSelect_TransformStandard.hxx>
#include <Handle_IFSelect_WorkLibrary.hxx>
#include <Handle_IFSelect_WorkSession.hxx>
%};

%import TCollection.i
%import STEPControl.i
%import MMgt.i
%import Standard.i
%import IFSelect.i
