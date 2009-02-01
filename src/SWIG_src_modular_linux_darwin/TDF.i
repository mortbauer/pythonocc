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
%module TDF

%include typemaps.i
%include cmalloc.i
%include cpointer.i
%include carrays.i
%include exception.i

#ifndef _Standard_TypeDef_HeaderFile
#define _Standard_TypeDef_HeaderFile
#define Standard_False (Standard_Boolean) 0
#define Standard_True  (Standard_Boolean) 1
#endif

/*
Exception handling
*/
%{#include <Standard_Failure.hxx>%}
%exception
{
    try
    {
        $action
    } 
    catch(Standard_Failure)
    {
        SWIG_exception(SWIG_RuntimeError,Standard_Failure::Caught()->DynamicType()->Name());
    }
}

/*
Standard_Real & function transformation
*/
%typemap(argout) Standard_Real &OutValue {
    PyObject *o, *o2, *o3;
    o = PyFloat_FromDouble(*$1);
    if ((!$result) || ($result == Py_None)) {
        $result = o;
    } else {
        if (!PyTuple_Check($result)) {
            PyObject *o2 = $result;
            $result = PyTuple_New(1);
            PyTuple_SetItem($result,0,o2);
        }
        o3 = PyTuple_New(1);
        PyTuple_SetItem(o3,0,o);
        o2 = $result;
        $result = PySequence_Concat(o2,o3);
        Py_DECREF(o2);
        Py_DECREF(o3);
    }
}

%typemap(in,numinputs=0) Standard_Real &OutValue(Standard_Real temp) {
    $1 = &temp;
}


%include TDF_dependencies.i


%include TDF_headers.i

typedef TDF_LabelNode * TDF_LabelNodePtr;
typedef Handle_NCollection_BaseAllocator TDF_HAllocator;



%nodefaultctor Handle_TDF_DoubleMapNodeOfGUIDProgIDMap;
class Handle_TDF_DoubleMapNodeOfGUIDProgIDMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DoubleMapNodeOfGUIDProgIDMap();
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfGUIDProgIDMap();
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfGUIDProgIDMap(const Handle_TDF_DoubleMapNodeOfGUIDProgIDMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfGUIDProgIDMap(const TDF_DoubleMapNodeOfGUIDProgIDMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfGUIDProgIDMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DoubleMapNodeOfGUIDProgIDMap {
	TDF_DoubleMapNodeOfGUIDProgIDMap* GetObject() {
	return (TDF_DoubleMapNodeOfGUIDProgIDMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_AttributeDelta;
class Handle_TDF_AttributeDelta : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_AttributeDelta();
		%feature("autodoc", "1");
		Handle_TDF_AttributeDelta();
		%feature("autodoc", "1");
		Handle_TDF_AttributeDelta(const Handle_TDF_AttributeDelta &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_AttributeDelta(const TDF_AttributeDelta *anItem);
		%feature("autodoc", "1");
		Handle_TDF_AttributeDelta const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_AttributeDelta {
	TDF_AttributeDelta* GetObject() {
	return (TDF_AttributeDelta*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_Attribute;
class Handle_TDF_Attribute : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_Attribute();
		%feature("autodoc", "1");
		Handle_TDF_Attribute();
		%feature("autodoc", "1");
		Handle_TDF_Attribute(const Handle_TDF_Attribute &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_Attribute(const TDF_Attribute *anItem);
		%feature("autodoc", "1");
		Handle_TDF_Attribute const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_Attribute {
	TDF_Attribute* GetObject() {
	return (TDF_Attribute*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_Reference;
class Handle_TDF_Reference : public Handle_TDF_Attribute {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_Reference();
		%feature("autodoc", "1");
		Handle_TDF_Reference();
		%feature("autodoc", "1");
		Handle_TDF_Reference(const Handle_TDF_Reference &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_Reference(const TDF_Reference *anItem);
		%feature("autodoc", "1");
		Handle_TDF_Reference const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_Reference {
	TDF_Reference* GetObject() {
	return (TDF_Reference*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_StdMapNodeOfLabelMap;
class Handle_TDF_StdMapNodeOfLabelMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_StdMapNodeOfLabelMap();
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfLabelMap();
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfLabelMap(const Handle_TDF_StdMapNodeOfLabelMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfLabelMap(const TDF_StdMapNodeOfLabelMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfLabelMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_StdMapNodeOfLabelMap {
	TDF_StdMapNodeOfLabelMap* GetObject() {
	return (TDF_StdMapNodeOfLabelMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DataMapNodeOfAttributeDataMap;
class Handle_TDF_DataMapNodeOfAttributeDataMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DataMapNodeOfAttributeDataMap();
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfAttributeDataMap();
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfAttributeDataMap(const Handle_TDF_DataMapNodeOfAttributeDataMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfAttributeDataMap(const TDF_DataMapNodeOfAttributeDataMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfAttributeDataMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DataMapNodeOfAttributeDataMap {
	TDF_DataMapNodeOfAttributeDataMap* GetObject() {
	return (TDF_DataMapNodeOfAttributeDataMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_StdMapNodeOfIDMap;
class Handle_TDF_StdMapNodeOfIDMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_StdMapNodeOfIDMap();
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfIDMap();
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfIDMap(const Handle_TDF_StdMapNodeOfIDMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfIDMap(const TDF_StdMapNodeOfIDMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfIDMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_StdMapNodeOfIDMap {
	TDF_StdMapNodeOfIDMap* GetObject() {
	return (TDF_StdMapNodeOfIDMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_SequenceNodeOfAttributeSequence;
class Handle_TDF_SequenceNodeOfAttributeSequence : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_SequenceNodeOfAttributeSequence();
		%feature("autodoc", "1");
		Handle_TDF_SequenceNodeOfAttributeSequence();
		%feature("autodoc", "1");
		Handle_TDF_SequenceNodeOfAttributeSequence(const Handle_TDF_SequenceNodeOfAttributeSequence &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_SequenceNodeOfAttributeSequence(const TDF_SequenceNodeOfAttributeSequence *anItem);
		%feature("autodoc", "1");
		Handle_TDF_SequenceNodeOfAttributeSequence const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_SequenceNodeOfAttributeSequence {
	TDF_SequenceNodeOfAttributeSequence* GetObject() {
	return (TDF_SequenceNodeOfAttributeSequence*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DataMapNodeOfLabelLabelMap;
class Handle_TDF_DataMapNodeOfLabelLabelMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DataMapNodeOfLabelLabelMap();
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelLabelMap();
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelLabelMap(const Handle_TDF_DataMapNodeOfLabelLabelMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelLabelMap(const TDF_DataMapNodeOfLabelLabelMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelLabelMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DataMapNodeOfLabelLabelMap {
	TDF_DataMapNodeOfLabelLabelMap* GetObject() {
	return (TDF_DataMapNodeOfLabelLabelMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DataSet;
class Handle_TDF_DataSet : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DataSet();
		%feature("autodoc", "1");
		Handle_TDF_DataSet();
		%feature("autodoc", "1");
		Handle_TDF_DataSet(const Handle_TDF_DataSet &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DataSet(const TDF_DataSet *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DataSet const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DataSet {
	TDF_DataSet* GetObject() {
	return (TDF_DataSet*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DeltaOnModification;
class Handle_TDF_DeltaOnModification : public Handle_TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DeltaOnModification();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnModification();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnModification(const Handle_TDF_DeltaOnModification &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnModification(const TDF_DeltaOnModification *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnModification const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnModification {
	TDF_DeltaOnModification* GetObject() {
	return (TDF_DeltaOnModification*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_Delta;
class Handle_TDF_Delta : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_Delta();
		%feature("autodoc", "1");
		Handle_TDF_Delta();
		%feature("autodoc", "1");
		Handle_TDF_Delta(const Handle_TDF_Delta &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_Delta(const TDF_Delta *anItem);
		%feature("autodoc", "1");
		Handle_TDF_Delta const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_Delta {
	TDF_Delta* GetObject() {
	return (TDF_Delta*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_ListNodeOfLabelList;
class Handle_TDF_ListNodeOfLabelList : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_ListNodeOfLabelList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfLabelList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfLabelList(const Handle_TDF_ListNodeOfLabelList &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfLabelList(const TDF_ListNodeOfLabelList *anItem);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfLabelList const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfLabelList {
	TDF_ListNodeOfLabelList* GetObject() {
	return (TDF_ListNodeOfLabelList*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_ListNodeOfAttributeList;
class Handle_TDF_ListNodeOfAttributeList : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_ListNodeOfAttributeList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfAttributeList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfAttributeList(const Handle_TDF_ListNodeOfAttributeList &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfAttributeList(const TDF_ListNodeOfAttributeList *anItem);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfAttributeList const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfAttributeList {
	TDF_ListNodeOfAttributeList* GetObject() {
	return (TDF_ListNodeOfAttributeList*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DoubleMapNodeOfLabelDoubleMap;
class Handle_TDF_DoubleMapNodeOfLabelDoubleMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DoubleMapNodeOfLabelDoubleMap();
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfLabelDoubleMap();
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfLabelDoubleMap(const Handle_TDF_DoubleMapNodeOfLabelDoubleMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfLabelDoubleMap(const TDF_DoubleMapNodeOfLabelDoubleMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfLabelDoubleMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DoubleMapNodeOfLabelDoubleMap {
	TDF_DoubleMapNodeOfLabelDoubleMap* GetObject() {
	return (TDF_DoubleMapNodeOfLabelDoubleMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DeltaOnRemoval;
class Handle_TDF_DeltaOnRemoval : public Handle_TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DeltaOnRemoval();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnRemoval();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnRemoval(const Handle_TDF_DeltaOnRemoval &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnRemoval(const TDF_DeltaOnRemoval *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnRemoval const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnRemoval {
	TDF_DeltaOnRemoval* GetObject() {
	return (TDF_DeltaOnRemoval*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DefaultDeltaOnRemoval;
class Handle_TDF_DefaultDeltaOnRemoval : public Handle_TDF_DeltaOnRemoval {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DefaultDeltaOnRemoval();
		%feature("autodoc", "1");
		Handle_TDF_DefaultDeltaOnRemoval();
		%feature("autodoc", "1");
		Handle_TDF_DefaultDeltaOnRemoval(const Handle_TDF_DefaultDeltaOnRemoval &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DefaultDeltaOnRemoval(const TDF_DefaultDeltaOnRemoval *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DefaultDeltaOnRemoval const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DefaultDeltaOnRemoval {
	TDF_DefaultDeltaOnRemoval* GetObject() {
	return (TDF_DefaultDeltaOnRemoval*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_ListNodeOfIDList;
class Handle_TDF_ListNodeOfIDList : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_ListNodeOfIDList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfIDList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfIDList(const Handle_TDF_ListNodeOfIDList &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfIDList(const TDF_ListNodeOfIDList *anItem);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfIDList const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfIDList {
	TDF_ListNodeOfIDList* GetObject() {
	return (TDF_ListNodeOfIDList*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DataMapNodeOfLabelIntegerMap;
class Handle_TDF_DataMapNodeOfLabelIntegerMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DataMapNodeOfLabelIntegerMap();
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelIntegerMap();
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelIntegerMap(const Handle_TDF_DataMapNodeOfLabelIntegerMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelIntegerMap(const TDF_DataMapNodeOfLabelIntegerMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelIntegerMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DataMapNodeOfLabelIntegerMap {
	TDF_DataMapNodeOfLabelIntegerMap* GetObject() {
	return (TDF_DataMapNodeOfLabelIntegerMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_RelocationTable;
class Handle_TDF_RelocationTable : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_RelocationTable();
		%feature("autodoc", "1");
		Handle_TDF_RelocationTable();
		%feature("autodoc", "1");
		Handle_TDF_RelocationTable(const Handle_TDF_RelocationTable &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_RelocationTable(const TDF_RelocationTable *anItem);
		%feature("autodoc", "1");
		Handle_TDF_RelocationTable const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_RelocationTable {
	TDF_RelocationTable* GetObject() {
	return (TDF_RelocationTable*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_ListNodeOfAttributeDeltaList;
class Handle_TDF_ListNodeOfAttributeDeltaList : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_ListNodeOfAttributeDeltaList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfAttributeDeltaList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfAttributeDeltaList(const Handle_TDF_ListNodeOfAttributeDeltaList &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfAttributeDeltaList(const TDF_ListNodeOfAttributeDeltaList *anItem);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfAttributeDeltaList const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfAttributeDeltaList {
	TDF_ListNodeOfAttributeDeltaList* GetObject() {
	return (TDF_ListNodeOfAttributeDeltaList*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DataMapNodeOfLabelDataMap;
class Handle_TDF_DataMapNodeOfLabelDataMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DataMapNodeOfLabelDataMap();
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelDataMap();
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelDataMap(const Handle_TDF_DataMapNodeOfLabelDataMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelDataMap(const TDF_DataMapNodeOfLabelDataMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DataMapNodeOfLabelDataMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DataMapNodeOfLabelDataMap {
	TDF_DataMapNodeOfLabelDataMap* GetObject() {
	return (TDF_DataMapNodeOfLabelDataMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DeltaOnAddition;
class Handle_TDF_DeltaOnAddition : public Handle_TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DeltaOnAddition();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnAddition();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnAddition(const Handle_TDF_DeltaOnAddition &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnAddition(const TDF_DeltaOnAddition *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnAddition const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnAddition {
	TDF_DeltaOnAddition* GetObject() {
	return (TDF_DeltaOnAddition*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DoubleMapNodeOfAttributeDoubleMap;
class Handle_TDF_DoubleMapNodeOfAttributeDoubleMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DoubleMapNodeOfAttributeDoubleMap();
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfAttributeDoubleMap();
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfAttributeDoubleMap(const Handle_TDF_DoubleMapNodeOfAttributeDoubleMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfAttributeDoubleMap(const TDF_DoubleMapNodeOfAttributeDoubleMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DoubleMapNodeOfAttributeDoubleMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DoubleMapNodeOfAttributeDoubleMap {
	TDF_DoubleMapNodeOfAttributeDoubleMap* GetObject() {
	return (TDF_DoubleMapNodeOfAttributeDoubleMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_TagSource;
class Handle_TDF_TagSource : public Handle_TDF_Attribute {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_TagSource();
		%feature("autodoc", "1");
		Handle_TDF_TagSource();
		%feature("autodoc", "1");
		Handle_TDF_TagSource(const Handle_TDF_TagSource &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_TagSource(const TDF_TagSource *anItem);
		%feature("autodoc", "1");
		Handle_TDF_TagSource const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_TagSource {
	TDF_TagSource* GetObject() {
	return (TDF_TagSource*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_SequenceNodeOfLabelSequence;
class Handle_TDF_SequenceNodeOfLabelSequence : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_SequenceNodeOfLabelSequence();
		%feature("autodoc", "1");
		Handle_TDF_SequenceNodeOfLabelSequence();
		%feature("autodoc", "1");
		Handle_TDF_SequenceNodeOfLabelSequence(const Handle_TDF_SequenceNodeOfLabelSequence &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_SequenceNodeOfLabelSequence(const TDF_SequenceNodeOfLabelSequence *anItem);
		%feature("autodoc", "1");
		Handle_TDF_SequenceNodeOfLabelSequence const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_SequenceNodeOfLabelSequence {
	TDF_SequenceNodeOfLabelSequence* GetObject() {
	return (TDF_SequenceNodeOfLabelSequence*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DeltaOnResume;
class Handle_TDF_DeltaOnResume : public Handle_TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DeltaOnResume();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnResume();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnResume(const Handle_TDF_DeltaOnResume &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnResume(const TDF_DeltaOnResume *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnResume const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnResume {
	TDF_DeltaOnResume* GetObject() {
	return (TDF_DeltaOnResume*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_Data;
class Handle_TDF_Data : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_Data();
		%feature("autodoc", "1");
		Handle_TDF_Data();
		%feature("autodoc", "1");
		Handle_TDF_Data(const Handle_TDF_Data &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_Data(const TDF_Data *anItem);
		%feature("autodoc", "1");
		Handle_TDF_Data const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_Data {
	TDF_Data* GetObject() {
	return (TDF_Data*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_IndexedMapNodeOfAttributeIndexedMap;
class Handle_TDF_IndexedMapNodeOfAttributeIndexedMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_IndexedMapNodeOfAttributeIndexedMap();
		%feature("autodoc", "1");
		Handle_TDF_IndexedMapNodeOfAttributeIndexedMap();
		%feature("autodoc", "1");
		Handle_TDF_IndexedMapNodeOfAttributeIndexedMap(const Handle_TDF_IndexedMapNodeOfAttributeIndexedMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_IndexedMapNodeOfAttributeIndexedMap(const TDF_IndexedMapNodeOfAttributeIndexedMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_IndexedMapNodeOfAttributeIndexedMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_IndexedMapNodeOfAttributeIndexedMap {
	TDF_IndexedMapNodeOfAttributeIndexedMap* GetObject() {
	return (TDF_IndexedMapNodeOfAttributeIndexedMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DefaultDeltaOnModification;
class Handle_TDF_DefaultDeltaOnModification : public Handle_TDF_DeltaOnModification {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DefaultDeltaOnModification();
		%feature("autodoc", "1");
		Handle_TDF_DefaultDeltaOnModification();
		%feature("autodoc", "1");
		Handle_TDF_DefaultDeltaOnModification(const Handle_TDF_DefaultDeltaOnModification &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DefaultDeltaOnModification(const TDF_DefaultDeltaOnModification *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DefaultDeltaOnModification const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DefaultDeltaOnModification {
	TDF_DefaultDeltaOnModification* GetObject() {
	return (TDF_DefaultDeltaOnModification*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_StdMapNodeOfAttributeMap;
class Handle_TDF_StdMapNodeOfAttributeMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_StdMapNodeOfAttributeMap();
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfAttributeMap();
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfAttributeMap(const Handle_TDF_StdMapNodeOfAttributeMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfAttributeMap(const TDF_StdMapNodeOfAttributeMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_StdMapNodeOfAttributeMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_StdMapNodeOfAttributeMap {
	TDF_StdMapNodeOfAttributeMap* GetObject() {
	return (TDF_StdMapNodeOfAttributeMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_HAttributeArray1;
class Handle_TDF_HAttributeArray1 : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_HAttributeArray1();
		%feature("autodoc", "1");
		Handle_TDF_HAttributeArray1();
		%feature("autodoc", "1");
		Handle_TDF_HAttributeArray1(const Handle_TDF_HAttributeArray1 &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_HAttributeArray1(const TDF_HAttributeArray1 *anItem);
		%feature("autodoc", "1");
		Handle_TDF_HAttributeArray1 const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_HAttributeArray1 {
	TDF_HAttributeArray1* GetObject() {
	return (TDF_HAttributeArray1*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_IndexedMapNodeOfLabelIndexedMap;
class Handle_TDF_IndexedMapNodeOfLabelIndexedMap : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_IndexedMapNodeOfLabelIndexedMap();
		%feature("autodoc", "1");
		Handle_TDF_IndexedMapNodeOfLabelIndexedMap();
		%feature("autodoc", "1");
		Handle_TDF_IndexedMapNodeOfLabelIndexedMap(const Handle_TDF_IndexedMapNodeOfLabelIndexedMap &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_IndexedMapNodeOfLabelIndexedMap(const TDF_IndexedMapNodeOfLabelIndexedMap *anItem);
		%feature("autodoc", "1");
		Handle_TDF_IndexedMapNodeOfLabelIndexedMap const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_IndexedMapNodeOfLabelIndexedMap {
	TDF_IndexedMapNodeOfLabelIndexedMap* GetObject() {
	return (TDF_IndexedMapNodeOfLabelIndexedMap*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_DeltaOnForget;
class Handle_TDF_DeltaOnForget : public Handle_TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_DeltaOnForget();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnForget();
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnForget(const Handle_TDF_DeltaOnForget &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnForget(const TDF_DeltaOnForget *anItem);
		%feature("autodoc", "1");
		Handle_TDF_DeltaOnForget const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_DeltaOnForget {
	TDF_DeltaOnForget* GetObject() {
	return (TDF_DeltaOnForget*)$self->Access();
	}
};

%nodefaultctor Handle_TDF_ListNodeOfDeltaList;
class Handle_TDF_ListNodeOfDeltaList : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TDF_ListNodeOfDeltaList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfDeltaList();
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfDeltaList(const Handle_TDF_ListNodeOfDeltaList &aHandle);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfDeltaList(const TDF_ListNodeOfDeltaList *anItem);
		%feature("autodoc", "1");
		Handle_TDF_ListNodeOfDeltaList const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TDF_ListNodeOfDeltaList {
	TDF_ListNodeOfDeltaList* GetObject() {
	return (TDF_ListNodeOfDeltaList*)$self->Access();
	}
};

%nodefaultctor TDF_ListIteratorOfAttributeDeltaList;
class TDF_ListIteratorOfAttributeDeltaList {
	public:
		%feature("autodoc", "1");
		~TDF_ListIteratorOfAttributeDeltaList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfAttributeDeltaList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfAttributeDeltaList(const TDF_AttributeDeltaList &L);
		%feature("autodoc", "1");
		void Initialize(const TDF_AttributeDeltaList &L);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		Handle_TDF_AttributeDelta & Value() const;

};

%nodefaultctor TDF_DoubleMapNodeOfGUIDProgIDMap;
class TDF_DoubleMapNodeOfGUIDProgIDMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_DoubleMapNodeOfGUIDProgIDMap(const Standard_GUID &K1, const TCollection_ExtendedString &K2, const TCollection_MapNodePtr &n1, const TCollection_MapNodePtr &n2);
		%feature("autodoc", "1");
		Standard_GUID & Key1() const;
		%feature("autodoc", "1");
		TCollection_ExtendedString & Key2() const;
		%feature("autodoc", "1");
		TCollection_MapNodePtr & Next2() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DoubleMapNodeOfGUIDProgIDMap();

};
%extend TDF_DoubleMapNodeOfGUIDProgIDMap {
	Handle_TDF_DoubleMapNodeOfGUIDProgIDMap GetHandle() {
	return *(Handle_TDF_DoubleMapNodeOfGUIDProgIDMap*) &$self;
	}
};

%nodefaultctor TDF_DoubleMapIteratorOfGUIDProgIDMap;
class TDF_DoubleMapIteratorOfGUIDProgIDMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_DoubleMapIteratorOfGUIDProgIDMap();
		%feature("autodoc", "1");
		TDF_DoubleMapIteratorOfGUIDProgIDMap();
		%feature("autodoc", "1");
		TDF_DoubleMapIteratorOfGUIDProgIDMap(const TDF_GUIDProgIDMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_GUIDProgIDMap &aMap);
		%feature("autodoc", "1");
		const Standard_GUID & Key1() const;
		%feature("autodoc", "1");
		const TCollection_ExtendedString & Key2() const;

};

%nodefaultctor TDF_AttributeDoubleMap;
class TDF_AttributeDoubleMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_AttributeDoubleMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_AttributeDoubleMap & Assign(const TDF_AttributeDoubleMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_AttributeDoubleMap();
		%feature("autodoc", "1");
		void Bind(const Handle_TDF_Attribute &K1, const Handle_TDF_Attribute &K2);
		%feature("autodoc", "1");
		Standard_Boolean AreBound(const Handle_TDF_Attribute &K1, const Handle_TDF_Attribute &K2) const;
		%feature("autodoc", "1");
		Standard_Boolean IsBound1(const Handle_TDF_Attribute &K) const;
		%feature("autodoc", "1");
		Standard_Boolean IsBound2(const Handle_TDF_Attribute &K) const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Find1(const Handle_TDF_Attribute &K) const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Find2(const Handle_TDF_Attribute &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind1(const Handle_TDF_Attribute &K);
		%feature("autodoc", "1");
		Standard_Boolean UnBind2(const Handle_TDF_Attribute &K);

};

%nodefaultctor TDF_DeltaList;
class TDF_DeltaList {
	public:
		%feature("autodoc", "1");
		TDF_DeltaList();
		%feature("autodoc", "1");
		void Assign(const TDF_DeltaList &Other);
		%feature("autodoc", "1");
		Standard_Integer Extent() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_DeltaList();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void Prepend(const Handle_TDF_Delta &I);
		%feature("autodoc", "1");
		void Prepend(const Handle_TDF_Delta &I, TDF_ListIteratorOfDeltaList & theIt);
		%feature("autodoc", "1");
		void Prepend(TDF_DeltaList & Other);
		%feature("autodoc", "1");
		void Append(const Handle_TDF_Delta &I);
		%feature("autodoc", "1");
		void Append(const Handle_TDF_Delta &I, TDF_ListIteratorOfDeltaList & theIt);
		%feature("autodoc", "1");
		void Append(TDF_DeltaList & Other);
		%feature("autodoc", "1");
		Handle_TDF_Delta & First() const;
		%feature("autodoc", "1");
		Handle_TDF_Delta & Last() const;
		%feature("autodoc", "1");
		void RemoveFirst();
		%feature("autodoc", "1");
		void Remove(TDF_ListIteratorOfDeltaList & It);
		%feature("autodoc", "1");
		void InsertBefore(const Handle_TDF_Delta &I, TDF_ListIteratorOfDeltaList & It);
		%feature("autodoc", "1");
		void InsertBefore(TDF_DeltaList & Other, TDF_ListIteratorOfDeltaList & It);
		%feature("autodoc", "1");
		void InsertAfter(const Handle_TDF_Delta &I, TDF_ListIteratorOfDeltaList & It);
		%feature("autodoc", "1");
		void InsertAfter(TDF_DeltaList & Other, TDF_ListIteratorOfDeltaList & It);

};

%nodefaultctor TDF_MapIteratorOfAttributeMap;
class TDF_MapIteratorOfAttributeMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_MapIteratorOfAttributeMap();
		%feature("autodoc", "1");
		TDF_MapIteratorOfAttributeMap();
		%feature("autodoc", "1");
		TDF_MapIteratorOfAttributeMap(const TDF_AttributeMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_AttributeMap &aMap);
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Key() const;

};

%nodefaultctor TDF_Attribute;
class TDF_Attribute : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		const Standard_GUID & ID() const;
		%feature("autodoc", "1");
		TDF_Label const Label() const;
		%feature("autodoc", "1");
		Standard_Integer Transaction() const;
		%feature("autodoc", "1");
		Standard_Integer UntilTransaction() const;
		%feature("autodoc", "1");
		Standard_Boolean IsValid() const;
		%feature("autodoc", "1");
		Standard_Boolean IsNew() const;
		%feature("autodoc", "1");
		Standard_Boolean IsForgotten() const;
		%feature("autodoc", "1");
		Standard_Boolean IsAttribute(const Standard_GUID &anID) const;
		%feature("autodoc", "1");
		Standard_Boolean FindAttribute(const Standard_GUID &anID, Handle_TDF_Attribute & anAttribute) const;
		%feature("autodoc", "1");
		void AddAttribute(const Handle_TDF_Attribute &other) const;
		%feature("autodoc", "1");
		Standard_Boolean ForgetAttribute(const Standard_GUID &aguid) const;
		%feature("autodoc", "1");
		void ForgetAllAttributes(const Standard_Boolean clearChildren=1) const;
		%feature("autodoc", "1");
		virtual		void AfterAddition();
		%feature("autodoc", "1");
		virtual		void BeforeRemoval();
		%feature("autodoc", "1");
		virtual		void BeforeForget();
		%feature("autodoc", "1");
		virtual		void AfterResume();
		%feature("autodoc", "1");
		virtual		Standard_Boolean AfterRetrieval(const Standard_Boolean forceIt=0);
		%feature("autodoc", "1");
		virtual		Standard_Boolean BeforeUndo(const Handle_TDF_AttributeDelta &anAttDelta, const Standard_Boolean forceIt=0);
		%feature("autodoc", "1");
		virtual		Standard_Boolean AfterUndo(const Handle_TDF_AttributeDelta &anAttDelta, const Standard_Boolean forceIt=0);
		%feature("autodoc", "1");
		virtual		void BeforeCommitTransaction();
		%feature("autodoc", "1");
		void Backup();
		%feature("autodoc", "1");
		Standard_Boolean IsBackuped() const;
		%feature("autodoc", "1");
		virtual		Handle_TDF_Attribute BackupCopy() const;
		%feature("autodoc", "1");
		virtual		void Restore(const Handle_TDF_Attribute &anAttribute);
		%feature("autodoc", "1");
		virtual		Handle_TDF_DeltaOnAddition DeltaOnAddition() const;
		%feature("autodoc", "1");
		virtual		Handle_TDF_DeltaOnForget DeltaOnForget() const;
		%feature("autodoc", "1");
		virtual		Handle_TDF_DeltaOnResume DeltaOnResume() const;
		%feature("autodoc", "1");
		virtual		Handle_TDF_DeltaOnModification DeltaOnModification(const Handle_TDF_Attribute &anOldAttribute) const;
		%feature("autodoc", "1");
		virtual		void DeltaOnModification(const Handle_TDF_DeltaOnModification &aDelta);
		%feature("autodoc", "1");
		virtual		Handle_TDF_DeltaOnRemoval DeltaOnRemoval() const;
		%feature("autodoc", "1");
		virtual		Handle_TDF_Attribute NewEmpty() const;
		%feature("autodoc", "1");
		virtual		void Paste(const Handle_TDF_Attribute &intoAttribute, const Handle_TDF_RelocationTable &aRelocationTable) const;
		%feature("autodoc", "1");
		virtual		void References(const Handle_TDF_DataSet &aDataSet) const;
		%feature("autodoc", "1");
		virtual		Standard_OStream & Dump(Standard_OStream & anOS) const;
		%feature("autodoc", "1");
		virtual		void ExtendedDump(Standard_OStream & anOS, const TDF_IDFilter &aFilter, TDF_AttributeIndexedMap & aMap) const;
		%feature("autodoc", "1");
		void Forget(const Standard_Integer aTransaction);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TDF_Attribute {
	Handle_TDF_Attribute GetHandle() {
	return *(Handle_TDF_Attribute*) &$self;
	}
};

%nodefaultctor TDF_AttributeDelta;
class TDF_AttributeDelta : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		virtual		void Apply();
		%feature("autodoc", "1");
		TDF_Label Label() const;
		%feature("autodoc", "1");
		Handle_TDF_Attribute Attribute() const;
		%feature("autodoc", "1");
		Standard_GUID ID() const;
		%feature("autodoc", "1");
		virtual		Standard_OStream & Dump(Standard_OStream & OS) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TDF_AttributeDelta {
	Handle_TDF_AttributeDelta GetHandle() {
	return *(Handle_TDF_AttributeDelta*) &$self;
	}
};

%nodefaultctor TDF_DeltaOnAddition;
class TDF_DeltaOnAddition : public TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		TDF_DeltaOnAddition(const Handle_TDF_Attribute &anAtt);
		%feature("autodoc", "1");
		virtual		void Apply();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DeltaOnAddition();

};
%extend TDF_DeltaOnAddition {
	Handle_TDF_DeltaOnAddition GetHandle() {
	return *(Handle_TDF_DeltaOnAddition*) &$self;
	}
};

%nodefaultctor TDF_ListIteratorOfIDList;
class TDF_ListIteratorOfIDList {
	public:
		%feature("autodoc", "1");
		~TDF_ListIteratorOfIDList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfIDList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfIDList(const TDF_IDList &L);
		%feature("autodoc", "1");
		void Initialize(const TDF_IDList &L);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		Standard_GUID & Value() const;

};

%nodefaultctor TDF_DeltaOnModification;
class TDF_DeltaOnModification : public TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		virtual		void Apply();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DeltaOnModification();

};
%extend TDF_DeltaOnModification {
	Handle_TDF_DeltaOnModification GetHandle() {
	return *(Handle_TDF_DeltaOnModification*) &$self;
	}
};

%nodefaultctor TDF_StdMapNodeOfIDMap;
class TDF_StdMapNodeOfIDMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_StdMapNodeOfIDMap(const Standard_GUID &K, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Standard_GUID & Key() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_StdMapNodeOfIDMap();

};
%extend TDF_StdMapNodeOfIDMap {
	Handle_TDF_StdMapNodeOfIDMap GetHandle() {
	return *(Handle_TDF_StdMapNodeOfIDMap*) &$self;
	}
};

%nodefaultctor TDF_DeltaOnRemoval;
class TDF_DeltaOnRemoval : public TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TDF_DeltaOnRemoval {
	Handle_TDF_DeltaOnRemoval GetHandle() {
	return *(Handle_TDF_DeltaOnRemoval*) &$self;
	}
};

%nodefaultctor TDF_DefaultDeltaOnRemoval;
class TDF_DefaultDeltaOnRemoval : public TDF_DeltaOnRemoval {
	public:
		%feature("autodoc", "1");
		TDF_DefaultDeltaOnRemoval(const Handle_TDF_Attribute &anAttribute);
		%feature("autodoc", "1");
		virtual		void Apply();
		%feature("autodoc", "1");
		virtual		~TDF_DefaultDeltaOnRemoval();

};
%extend TDF_DefaultDeltaOnRemoval {
	Handle_TDF_DefaultDeltaOnRemoval GetHandle() {
	return *(Handle_TDF_DefaultDeltaOnRemoval*) &$self;
	}
};

%nodefaultctor TDF_LabelMapHasher;
class TDF_LabelMapHasher {
	public:
		%feature("autodoc", "1");
		~TDF_LabelMapHasher();
		%feature("autodoc", "1");
		TDF_LabelMapHasher();
		%feature("autodoc", "1");
		Standard_Integer HashCode(const TDF_Label &aLab, const Standard_Integer Upper);
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const TDF_Label &aLab1, const TDF_Label &aLab2);

};

%nodefaultctor TDF_IndexedMapNodeOfAttributeIndexedMap;
class TDF_IndexedMapNodeOfAttributeIndexedMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_IndexedMapNodeOfAttributeIndexedMap(const Handle_TDF_Attribute &K1, const Standard_Integer K2, const TCollection_MapNodePtr &n1, const TCollection_MapNodePtr &n2);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Key1() const;
		%feature("autodoc", "1");
		Standard_Integer & Key2() const;
		%feature("autodoc", "1");
		TCollection_MapNodePtr & Next2() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_IndexedMapNodeOfAttributeIndexedMap();

};
%extend TDF_IndexedMapNodeOfAttributeIndexedMap {
	Handle_TDF_IndexedMapNodeOfAttributeIndexedMap GetHandle() {
	return *(Handle_TDF_IndexedMapNodeOfAttributeIndexedMap*) &$self;
	}
};

%nodefaultctor TDF_Label;
class TDF_Label {
	public:
		%feature("autodoc", "1");
		~TDF_Label();
		%feature("autodoc", "1");
		TDF_Label();
		%feature("autodoc", "1");
		void Nullify();
		%feature("autodoc", "1");
		Handle_TDF_Data Data() const;
		%feature("autodoc", "1");
		Standard_Integer Tag() const;
		%feature("autodoc", "1");
		TDF_Label const Father() const;
		%feature("autodoc", "1");
		Standard_Boolean IsNull() const;
		%feature("autodoc", "1");
		void Imported(const Standard_Boolean aStatus) const;
		%feature("autodoc", "1");
		Standard_Boolean IsImported() const;
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const TDF_Label &aLabel) const;
		%feature("autodoc", "1");
		Standard_Boolean IsDifferent(const TDF_Label &aLabel) const;
		%feature("autodoc", "1");
		Standard_Boolean operator!=(const TDF_Label &aLabel) const;
		%feature("autodoc", "1");
		Standard_Boolean IsRoot() const;
		%feature("autodoc", "1");
		Standard_Boolean IsAttribute(const Standard_GUID &anID) const;
		%feature("autodoc", "1");
		void AddAttribute(const Handle_TDF_Attribute &anAttribute) const;
		%feature("autodoc", "1");
		void ForgetAttribute(const Handle_TDF_Attribute &anAttribute) const;
		%feature("autodoc", "1");
		Standard_Boolean ForgetAttribute(const Standard_GUID &aguid) const;
		%feature("autodoc", "1");
		void ForgetAllAttributes(const Standard_Boolean clearChildren=1) const;
		%feature("autodoc", "1");
		void ResumeAttribute(const Handle_TDF_Attribute &anAttribute) const;
		%feature("autodoc", "1");
		Standard_Boolean FindAttribute(const Standard_GUID &anID, Handle_TDF_Attribute & anAttribute) const;
		%feature("autodoc", "1");
		Standard_Boolean FindAttribute(const Standard_GUID &anID, const Standard_Integer aTransaction, Handle_TDF_Attribute & anAttribute) const;
		%feature("autodoc", "1");
		Standard_Boolean MayBeModified() const;
		%feature("autodoc", "1");
		Standard_Boolean AttributesModified() const;
		%feature("autodoc", "1");
		Standard_Boolean HasAttribute() const;
		%feature("autodoc", "1");
		Standard_Integer NbAttributes() const;
		%feature("autodoc", "1");
		Standard_Integer Depth() const;
		%feature("autodoc", "1");
		Standard_Boolean IsDescendant(const TDF_Label &aLabel) const;
		%feature("autodoc", "1");
		TDF_Label const Root() const;
		%feature("autodoc", "1");
		Standard_Boolean HasChild() const;
		%feature("autodoc", "1");
		Standard_Integer NbChildren() const;
		%feature("autodoc", "1");
		TDF_Label FindChild(const Standard_Integer aTag, const Standard_Boolean create=1) const;
		%feature("autodoc", "1");
		TDF_Label NewChild() const;
		%feature("autodoc", "1");
		Standard_Integer Transaction() const;
		%feature("autodoc", "1");
		Standard_Boolean HasLowerNode(const TDF_Label &otherLabel) const;
		%feature("autodoc", "1");
		Standard_Boolean HasGreaterNode(const TDF_Label &otherLabel) const;
		%feature("autodoc", "1");
		Standard_OStream & Dump(Standard_OStream & anOS) const;
		%feature("autodoc", "1");
		void ExtendedDump(Standard_OStream & anOS, const TDF_IDFilter &aFilter, TDF_AttributeIndexedMap & aMap) const;
		%feature("autodoc", "1");
		void EntryDump(Standard_OStream & anOS) const;

};

%nodefaultctor TDF_MapIteratorOfLabelMap;
class TDF_MapIteratorOfLabelMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_MapIteratorOfLabelMap();
		%feature("autodoc", "1");
		TDF_MapIteratorOfLabelMap();
		%feature("autodoc", "1");
		TDF_MapIteratorOfLabelMap(const TDF_LabelMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_LabelMap &aMap);
		%feature("autodoc", "1");
		const TDF_Label & Key() const;

};

%nodefaultctor TDF_DataMapNodeOfLabelLabelMap;
class TDF_DataMapNodeOfLabelLabelMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_DataMapNodeOfLabelLabelMap(const TDF_Label &K, const TDF_Label &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TDF_Label & Key() const;
		%feature("autodoc", "1");
		TDF_Label & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DataMapNodeOfLabelLabelMap();

};
%extend TDF_DataMapNodeOfLabelLabelMap {
	Handle_TDF_DataMapNodeOfLabelLabelMap GetHandle() {
	return *(Handle_TDF_DataMapNodeOfLabelLabelMap*) &$self;
	}
};

%nodefaultctor TDF_ListNodeOfDeltaList;
class TDF_ListNodeOfDeltaList : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_ListNodeOfDeltaList(const Handle_TDF_Delta &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Handle_TDF_Delta & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_ListNodeOfDeltaList();

};
%extend TDF_ListNodeOfDeltaList {
	Handle_TDF_ListNodeOfDeltaList GetHandle() {
	return *(Handle_TDF_ListNodeOfDeltaList*) &$self;
	}
};

%nodefaultctor TDF_Data;
class TDF_Data : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TDF_Data();
		%feature("autodoc", "1");
		TDF_Label const Root() const;
		%feature("autodoc", "1");
		Standard_Integer Transaction() const;
		%feature("autodoc", "1");
		Standard_Integer Time() const;
		%feature("autodoc", "1");
		Standard_Boolean IsApplicable(const Handle_TDF_Delta &aDelta) const;
		%feature("autodoc", "1");
		Handle_TDF_Delta Undo(const Handle_TDF_Delta &aDelta, const Standard_Boolean withDelta=0);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		virtual		~TDF_Data();
		%feature("autodoc", "1");
		Standard_Boolean NotUndoMode() const;
		%feature("autodoc", "1");
		Standard_OStream & Dump(Standard_OStream & anOS) const;
		%feature("autodoc", "1");
		void AllowModification(const Standard_Boolean theAllowModification);
		%feature("autodoc", "1");
		Standard_Boolean IsModificationAllowed() const;
		%feature("autodoc", "1");
		const Handle_NCollection_BaseAllocator & LabelNodeAllocator() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend TDF_Data {
	Handle_TDF_Data GetHandle() {
	return *(Handle_TDF_Data*) &$self;
	}
};

%nodefaultctor TDF_DoubleMapNodeOfAttributeDoubleMap;
class TDF_DoubleMapNodeOfAttributeDoubleMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_DoubleMapNodeOfAttributeDoubleMap(const Handle_TDF_Attribute &K1, const Handle_TDF_Attribute &K2, const TCollection_MapNodePtr &n1, const TCollection_MapNodePtr &n2);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Key1() const;
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Key2() const;
		%feature("autodoc", "1");
		TCollection_MapNodePtr & Next2() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DoubleMapNodeOfAttributeDoubleMap();

};
%extend TDF_DoubleMapNodeOfAttributeDoubleMap {
	Handle_TDF_DoubleMapNodeOfAttributeDoubleMap GetHandle() {
	return *(Handle_TDF_DoubleMapNodeOfAttributeDoubleMap*) &$self;
	}
};

%nodefaultctor TDF_ClosureMode;
class TDF_ClosureMode {
	public:
		%feature("autodoc", "1");
		~TDF_ClosureMode();
		%feature("autodoc", "1");
		TDF_ClosureMode(const Standard_Boolean aMode=1);
		%feature("autodoc", "1");
		void Descendants(const Standard_Boolean aStatus);
		%feature("autodoc", "1");
		Standard_Boolean Descendants() const;
		%feature("autodoc", "1");
		void References(const Standard_Boolean aStatus);
		%feature("autodoc", "1");
		Standard_Boolean References() const;

};

%nodefaultctor TDF_LabelIndexedMap;
class TDF_LabelIndexedMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_LabelIndexedMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_LabelIndexedMap & Assign(const TDF_LabelIndexedMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_LabelIndexedMap();
		%feature("autodoc", "1");
		Standard_Integer Add(const TDF_Label &K);
		%feature("autodoc", "1");
		void Substitute(const Standard_Integer I, const TDF_Label &K);
		%feature("autodoc", "1");
		void RemoveLast();
		%feature("autodoc", "1");
		Standard_Boolean Contains(const TDF_Label &K) const;
		%feature("autodoc", "1");
		const TDF_Label & FindKey(const Standard_Integer I) const;
		%feature("autodoc", "1");
		const TDF_Label & operator()(const Standard_Integer I) const;
		%feature("autodoc", "1");
		Standard_Integer FindIndex(const TDF_Label &K) const;

};

%nodefaultctor TDF_AttributeMap;
class TDF_AttributeMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_AttributeMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_AttributeMap & Assign(const TDF_AttributeMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_AttributeMap();
		%feature("autodoc", "1");
		Standard_Boolean Add(const Handle_TDF_Attribute &aKey);
		%feature("autodoc", "1");
		Standard_Boolean Contains(const Handle_TDF_Attribute &aKey) const;
		%feature("autodoc", "1");
		Standard_Boolean Remove(const Handle_TDF_Attribute &aKey);

};

%nodefaultctor TDF_LabelSequence;
class TDF_LabelSequence : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		TDF_LabelSequence();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_LabelSequence();
		%feature("autodoc", "1");
		const TDF_LabelSequence & Assign(const TDF_LabelSequence &Other);
		%feature("autodoc", "1");
		void Append(const TDF_Label &T);
		%feature("autodoc", "1");
		void Append(TDF_LabelSequence & S);
		%feature("autodoc", "1");
		void Prepend(const TDF_Label &T);
		%feature("autodoc", "1");
		void Prepend(TDF_LabelSequence & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const TDF_Label &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, TDF_LabelSequence & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const TDF_Label &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, TDF_LabelSequence & S);
		%feature("autodoc", "1");
		const TDF_Label & First() const;
		%feature("autodoc", "1");
		const TDF_Label & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, TDF_LabelSequence & S);
		%feature("autodoc", "1");
		const TDF_Label & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const TDF_Label & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const TDF_Label &I);
		%feature("autodoc", "1");
		TDF_Label & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		TDF_Label & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor TDF_LabelMap;
class TDF_LabelMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_LabelMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_LabelMap & Assign(const TDF_LabelMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_LabelMap();
		%feature("autodoc", "1");
		Standard_Boolean Add(const TDF_Label &aKey);
		%feature("autodoc", "1");
		Standard_Boolean Contains(const TDF_Label &aKey) const;
		%feature("autodoc", "1");
		Standard_Boolean Remove(const TDF_Label &aKey);

};

%nodefaultctor TDF_LabelDataMap;
class TDF_LabelDataMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_LabelDataMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_LabelDataMap & Assign(const TDF_LabelDataMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_LabelDataMap();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const TDF_Label &K, const TDF_Label &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const TDF_Label &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const TDF_Label &K);
		%feature("autodoc", "1");
		const TDF_Label & Find(const TDF_Label &K) const;
		%feature("autodoc", "1");
		const TDF_Label & operator()(const TDF_Label &K) const;
		%feature("autodoc", "1");
		TDF_Label & ChangeFind(const TDF_Label &K);
		%feature("autodoc", "1");
		TDF_Label & operator()(const TDF_Label &K);

};

%nodefaultctor TDF_MapIteratorOfIDMap;
class TDF_MapIteratorOfIDMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_MapIteratorOfIDMap();
		%feature("autodoc", "1");
		TDF_MapIteratorOfIDMap();
		%feature("autodoc", "1");
		TDF_MapIteratorOfIDMap(const TDF_IDMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_IDMap &aMap);
		%feature("autodoc", "1");
		const Standard_GUID & Key() const;

};

%nodefaultctor TDF_LabelList;
class TDF_LabelList {
	public:
		%feature("autodoc", "1");
		TDF_LabelList();
		%feature("autodoc", "1");
		void Assign(const TDF_LabelList &Other);
		%feature("autodoc", "1");
		Standard_Integer Extent() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_LabelList();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void Prepend(const TDF_Label &I);
		%feature("autodoc", "1");
		void Prepend(const TDF_Label &I, TDF_ListIteratorOfLabelList & theIt);
		%feature("autodoc", "1");
		void Prepend(TDF_LabelList & Other);
		%feature("autodoc", "1");
		void Append(const TDF_Label &I);
		%feature("autodoc", "1");
		void Append(const TDF_Label &I, TDF_ListIteratorOfLabelList & theIt);
		%feature("autodoc", "1");
		void Append(TDF_LabelList & Other);
		%feature("autodoc", "1");
		TDF_Label & First() const;
		%feature("autodoc", "1");
		TDF_Label & Last() const;
		%feature("autodoc", "1");
		void RemoveFirst();
		%feature("autodoc", "1");
		void Remove(TDF_ListIteratorOfLabelList & It);
		%feature("autodoc", "1");
		void InsertBefore(const TDF_Label &I, TDF_ListIteratorOfLabelList & It);
		%feature("autodoc", "1");
		void InsertBefore(TDF_LabelList & Other, TDF_ListIteratorOfLabelList & It);
		%feature("autodoc", "1");
		void InsertAfter(const TDF_Label &I, TDF_ListIteratorOfLabelList & It);
		%feature("autodoc", "1");
		void InsertAfter(TDF_LabelList & Other, TDF_ListIteratorOfLabelList & It);

};

%nodefaultctor TDF_DefaultDeltaOnModification;
class TDF_DefaultDeltaOnModification : public TDF_DeltaOnModification {
	public:
		%feature("autodoc", "1");
		TDF_DefaultDeltaOnModification(const Handle_TDF_Attribute &anAttribute);
		%feature("autodoc", "1");
		virtual		void Apply();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DefaultDeltaOnModification();

};
%extend TDF_DefaultDeltaOnModification {
	Handle_TDF_DefaultDeltaOnModification GetHandle() {
	return *(Handle_TDF_DefaultDeltaOnModification*) &$self;
	}
};

%nodefaultctor TDF_IDFilter;
class TDF_IDFilter {
	public:
		%feature("autodoc", "1");
		~TDF_IDFilter();
		%feature("autodoc", "1");
		TDF_IDFilter(const Standard_Boolean ignoreMode=1);
		%feature("autodoc", "1");
		void IgnoreAll(const Standard_Boolean ignore);
		%feature("autodoc", "1");
		Standard_Boolean IgnoreAll() const;
		%feature("autodoc", "1");
		void Keep(const Standard_GUID &anID);
		%feature("autodoc", "1");
		void Keep(const TDF_IDList &anIDList);
		%feature("autodoc", "1");
		void Ignore(const Standard_GUID &anID);
		%feature("autodoc", "1");
		void Ignore(const TDF_IDList &anIDList);
		%feature("autodoc", "1");
		Standard_Boolean IsKept(const Standard_GUID &anID) const;
		%feature("autodoc", "1");
		Standard_Boolean IsKept(const Handle_TDF_Attribute &anAtt) const;
		%feature("autodoc", "1");
		Standard_Boolean IsIgnored(const Standard_GUID &anID) const;
		%feature("autodoc", "1");
		Standard_Boolean IsIgnored(const Handle_TDF_Attribute &anAtt) const;
		%feature("autodoc", "1");
		void IDList(TDF_IDList & anIDList) const;
		%feature("autodoc", "1");
		void Copy(const TDF_IDFilter &fromFilter);
		%feature("autodoc", "1");
		void Dump(Standard_OStream & anOS) const;

};

%nodefaultctor TDF_ListNodeOfIDList;
class TDF_ListNodeOfIDList : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_ListNodeOfIDList(const Standard_GUID &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Standard_GUID & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_ListNodeOfIDList();

};
%extend TDF_ListNodeOfIDList {
	Handle_TDF_ListNodeOfIDList GetHandle() {
	return *(Handle_TDF_ListNodeOfIDList*) &$self;
	}
};

%nodefaultctor TDF_AttributeSequence;
class TDF_AttributeSequence : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		TDF_AttributeSequence();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_AttributeSequence();
		%feature("autodoc", "1");
		const TDF_AttributeSequence & Assign(const TDF_AttributeSequence &Other);
		%feature("autodoc", "1");
		void Append(const Handle_TDF_Attribute &T);
		%feature("autodoc", "1");
		void Append(TDF_AttributeSequence & S);
		%feature("autodoc", "1");
		void Prepend(const Handle_TDF_Attribute &T);
		%feature("autodoc", "1");
		void Prepend(TDF_AttributeSequence & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Handle_TDF_Attribute &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, TDF_AttributeSequence & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Handle_TDF_Attribute &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, TDF_AttributeSequence & S);
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & First() const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, TDF_AttributeSequence & S);
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_TDF_Attribute &I);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor TDF_ListNodeOfAttributeDeltaList;
class TDF_ListNodeOfAttributeDeltaList : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_ListNodeOfAttributeDeltaList(const Handle_TDF_AttributeDelta &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Handle_TDF_AttributeDelta & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_ListNodeOfAttributeDeltaList();

};
%extend TDF_ListNodeOfAttributeDeltaList {
	Handle_TDF_ListNodeOfAttributeDeltaList GetHandle() {
	return *(Handle_TDF_ListNodeOfAttributeDeltaList*) &$self;
	}
};

%nodefaultctor TDF_IndexedMapNodeOfLabelIndexedMap;
class TDF_IndexedMapNodeOfLabelIndexedMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_IndexedMapNodeOfLabelIndexedMap(const TDF_Label &K1, const Standard_Integer K2, const TCollection_MapNodePtr &n1, const TCollection_MapNodePtr &n2);
		%feature("autodoc", "1");
		TDF_Label & Key1() const;
		%feature("autodoc", "1");
		Standard_Integer & Key2() const;
		%feature("autodoc", "1");
		TCollection_MapNodePtr & Next2() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_IndexedMapNodeOfLabelIndexedMap();

};
%extend TDF_IndexedMapNodeOfLabelIndexedMap {
	Handle_TDF_IndexedMapNodeOfLabelIndexedMap GetHandle() {
	return *(Handle_TDF_IndexedMapNodeOfLabelIndexedMap*) &$self;
	}
};

%nodefaultctor TDF_TagSource;
class TDF_TagSource : public TDF_Attribute {
	public:
		%feature("autodoc", "1");
		const Standard_GUID & GetID();
		%feature("autodoc", "1");
		Handle_TDF_TagSource Set(const TDF_Label &label);
		%feature("autodoc", "1");
		TDF_Label NewChild(const TDF_Label &L);
		%feature("autodoc", "1");
		TDF_TagSource();
		%feature("autodoc", "1");
		Standard_Integer NewTag();
		%feature("autodoc", "1");
		TDF_Label NewChild();
		%feature("autodoc", "1");
		Standard_Integer Get() const;
		%feature("autodoc", "1");
		void Set(const Standard_Integer T);
		%feature("autodoc", "1");
		virtual		const Standard_GUID & ID() const;
		%feature("autodoc", "1");
		virtual		void Restore(const Handle_TDF_Attribute &with);
		%feature("autodoc", "1");
		virtual		Handle_TDF_Attribute NewEmpty() const;
		%feature("autodoc", "1");
		virtual		void Paste(const Handle_TDF_Attribute &Into, const Handle_TDF_RelocationTable &RT) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_TagSource();

};
%extend TDF_TagSource {
	Handle_TDF_TagSource GetHandle() {
	return *(Handle_TDF_TagSource*) &$self;
	}
};

%nodefaultctor TDF_AttributeList;
class TDF_AttributeList {
	public:
		%feature("autodoc", "1");
		TDF_AttributeList();
		%feature("autodoc", "1");
		void Assign(const TDF_AttributeList &Other);
		%feature("autodoc", "1");
		Standard_Integer Extent() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_AttributeList();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void Prepend(const Handle_TDF_Attribute &I);
		%feature("autodoc", "1");
		void Prepend(const Handle_TDF_Attribute &I, TDF_ListIteratorOfAttributeList & theIt);
		%feature("autodoc", "1");
		void Prepend(TDF_AttributeList & Other);
		%feature("autodoc", "1");
		void Append(const Handle_TDF_Attribute &I);
		%feature("autodoc", "1");
		void Append(const Handle_TDF_Attribute &I, TDF_ListIteratorOfAttributeList & theIt);
		%feature("autodoc", "1");
		void Append(TDF_AttributeList & Other);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & First() const;
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Last() const;
		%feature("autodoc", "1");
		void RemoveFirst();
		%feature("autodoc", "1");
		void Remove(TDF_ListIteratorOfAttributeList & It);
		%feature("autodoc", "1");
		void InsertBefore(const Handle_TDF_Attribute &I, TDF_ListIteratorOfAttributeList & It);
		%feature("autodoc", "1");
		void InsertBefore(TDF_AttributeList & Other, TDF_ListIteratorOfAttributeList & It);
		%feature("autodoc", "1");
		void InsertAfter(const Handle_TDF_Attribute &I, TDF_ListIteratorOfAttributeList & It);
		%feature("autodoc", "1");
		void InsertAfter(TDF_AttributeList & Other, TDF_ListIteratorOfAttributeList & It);

};

%nodefaultctor TDF_DoubleMapNodeOfLabelDoubleMap;
class TDF_DoubleMapNodeOfLabelDoubleMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_DoubleMapNodeOfLabelDoubleMap(const TDF_Label &K1, const TDF_Label &K2, const TCollection_MapNodePtr &n1, const TCollection_MapNodePtr &n2);
		%feature("autodoc", "1");
		TDF_Label & Key1() const;
		%feature("autodoc", "1");
		TDF_Label & Key2() const;
		%feature("autodoc", "1");
		TCollection_MapNodePtr & Next2() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DoubleMapNodeOfLabelDoubleMap();

};
%extend TDF_DoubleMapNodeOfLabelDoubleMap {
	Handle_TDF_DoubleMapNodeOfLabelDoubleMap GetHandle() {
	return *(Handle_TDF_DoubleMapNodeOfLabelDoubleMap*) &$self;
	}
};

%nodefaultctor TDF_SequenceNodeOfLabelSequence;
class TDF_SequenceNodeOfLabelSequence : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		TDF_SequenceNodeOfLabelSequence(const TDF_Label &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		TDF_Label & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_SequenceNodeOfLabelSequence();

};
%extend TDF_SequenceNodeOfLabelSequence {
	Handle_TDF_SequenceNodeOfLabelSequence GetHandle() {
	return *(Handle_TDF_SequenceNodeOfLabelSequence*) &$self;
	}
};

%nodefaultctor TDF_ChildIDIterator;
class TDF_ChildIDIterator {
	public:
		%feature("autodoc", "1");
		~TDF_ChildIDIterator();
		%feature("autodoc", "1");
		TDF_ChildIDIterator();
		%feature("autodoc", "1");
		TDF_ChildIDIterator(const TDF_Label &aLabel, const Standard_GUID &anID, const Standard_Boolean allLevels=0);
		%feature("autodoc", "1");
		void Initialize(const TDF_Label &aLabel, const Standard_GUID &anID, const Standard_Boolean allLevels=0);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		void NextBrother();
		%feature("autodoc", "1");
		Handle_TDF_Attribute Value() const;

};

%nodefaultctor TDF_CopyTool;
class TDF_CopyTool {
	public:
		%feature("autodoc", "1");
		~TDF_CopyTool();
		%feature("autodoc", "1");
		TDF_CopyTool();
		%feature("autodoc", "1");
		void Copy(const Handle_TDF_DataSet &aSourceDataSet, const Handle_TDF_RelocationTable &aRelocationTable);
		%feature("autodoc", "1");
		void Copy(const Handle_TDF_DataSet &aSourceDataSet, const Handle_TDF_RelocationTable &aRelocationTable, const TDF_IDFilter &aPrivilegeFilter);
		%feature("autodoc", "1");
		void Copy(const Handle_TDF_DataSet &aSourceDataSet, const Handle_TDF_RelocationTable &aRelocationTable, const TDF_IDFilter &aPrivilegeFilter, const TDF_IDFilter &aRefFilter, const Standard_Boolean setSelfContained);

};

%nodefaultctor TDF_DataMapNodeOfAttributeDataMap;
class TDF_DataMapNodeOfAttributeDataMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_DataMapNodeOfAttributeDataMap(const Handle_TDF_Attribute &K, const Handle_TDF_Attribute &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Key() const;
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DataMapNodeOfAttributeDataMap();

};
%extend TDF_DataMapNodeOfAttributeDataMap {
	Handle_TDF_DataMapNodeOfAttributeDataMap GetHandle() {
	return *(Handle_TDF_DataMapNodeOfAttributeDataMap*) &$self;
	}
};

%nodefaultctor TDF_DataMapIteratorOfLabelIntegerMap;
class TDF_DataMapIteratorOfLabelIntegerMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_DataMapIteratorOfLabelIntegerMap();
		%feature("autodoc", "1");
		TDF_DataMapIteratorOfLabelIntegerMap();
		%feature("autodoc", "1");
		TDF_DataMapIteratorOfLabelIntegerMap(const TDF_LabelIntegerMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_LabelIntegerMap &aMap);
		%feature("autodoc", "1");
		const TDF_Label & Key() const;
		%feature("autodoc", "1");
		const Standard_Integer & Value() const;

};

%nodefaultctor TDF_DataMapIteratorOfLabelLabelMap;
class TDF_DataMapIteratorOfLabelLabelMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_DataMapIteratorOfLabelLabelMap();
		%feature("autodoc", "1");
		TDF_DataMapIteratorOfLabelLabelMap();
		%feature("autodoc", "1");
		TDF_DataMapIteratorOfLabelLabelMap(const TDF_LabelLabelMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_LabelLabelMap &aMap);
		%feature("autodoc", "1");
		const TDF_Label & Key() const;
		%feature("autodoc", "1");
		const TDF_Label & Value() const;

};

%nodefaultctor TDF_AttributeDataMap;
class TDF_AttributeDataMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_AttributeDataMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_AttributeDataMap & Assign(const TDF_AttributeDataMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_AttributeDataMap();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const Handle_TDF_Attribute &K, const Handle_TDF_Attribute &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const Handle_TDF_Attribute &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const Handle_TDF_Attribute &K);
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Find(const Handle_TDF_Attribute &K) const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & operator()(const Handle_TDF_Attribute &K) const;
		%feature("autodoc", "1");
		Handle_TDF_Attribute & ChangeFind(const Handle_TDF_Attribute &K);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & operator()(const Handle_TDF_Attribute &K);

};

%nodefaultctor TDF_DeltaOnForget;
class TDF_DeltaOnForget : public TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		TDF_DeltaOnForget(const Handle_TDF_Attribute &anAtt);
		%feature("autodoc", "1");
		virtual		void Apply();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DeltaOnForget();

};
%extend TDF_DeltaOnForget {
	Handle_TDF_DeltaOnForget GetHandle() {
	return *(Handle_TDF_DeltaOnForget*) &$self;
	}
};

%nodefaultctor TDF_GUIDProgIDMap;
class TDF_GUIDProgIDMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_GUIDProgIDMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_GUIDProgIDMap & Assign(const TDF_GUIDProgIDMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_GUIDProgIDMap();
		%feature("autodoc", "1");
		void Bind(const Standard_GUID &K1, const TCollection_ExtendedString &K2);
		%feature("autodoc", "1");
		Standard_Boolean AreBound(const Standard_GUID &K1, const TCollection_ExtendedString &K2) const;
		%feature("autodoc", "1");
		Standard_Boolean IsBound1(const Standard_GUID &K) const;
		%feature("autodoc", "1");
		Standard_Boolean IsBound2(const TCollection_ExtendedString &K) const;
		%feature("autodoc", "1");
		const TCollection_ExtendedString & Find1(const Standard_GUID &K) const;
		%feature("autodoc", "1");
		const Standard_GUID & Find2(const TCollection_ExtendedString &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind1(const Standard_GUID &K);
		%feature("autodoc", "1");
		Standard_Boolean UnBind2(const TCollection_ExtendedString &K);

};

%nodefaultctor TDF_IDList;
class TDF_IDList {
	public:
		%feature("autodoc", "1");
		TDF_IDList();
		%feature("autodoc", "1");
		void Assign(const TDF_IDList &Other);
		%feature("autodoc", "1");
		Standard_Integer Extent() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_IDList();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void Prepend(const Standard_GUID &I);
		%feature("autodoc", "1");
		void Prepend(const Standard_GUID &I, TDF_ListIteratorOfIDList & theIt);
		%feature("autodoc", "1");
		void Prepend(TDF_IDList & Other);
		%feature("autodoc", "1");
		void Append(const Standard_GUID &I);
		%feature("autodoc", "1");
		void Append(const Standard_GUID &I, TDF_ListIteratorOfIDList & theIt);
		%feature("autodoc", "1");
		void Append(TDF_IDList & Other);
		%feature("autodoc", "1");
		Standard_GUID & First() const;
		%feature("autodoc", "1");
		Standard_GUID & Last() const;
		%feature("autodoc", "1");
		void RemoveFirst();
		%feature("autodoc", "1");
		void Remove(TDF_ListIteratorOfIDList & It);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_GUID &I, TDF_ListIteratorOfIDList & It);
		%feature("autodoc", "1");
		void InsertBefore(TDF_IDList & Other, TDF_ListIteratorOfIDList & It);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_GUID &I, TDF_ListIteratorOfIDList & It);
		%feature("autodoc", "1");
		void InsertAfter(TDF_IDList & Other, TDF_ListIteratorOfIDList & It);

};

%nodefaultctor TDF_DataMapIteratorOfAttributeDataMap;
class TDF_DataMapIteratorOfAttributeDataMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_DataMapIteratorOfAttributeDataMap();
		%feature("autodoc", "1");
		TDF_DataMapIteratorOfAttributeDataMap();
		%feature("autodoc", "1");
		TDF_DataMapIteratorOfAttributeDataMap(const TDF_AttributeDataMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_AttributeDataMap &aMap);
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Key() const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Value() const;

};

%nodefaultctor TDF_Tool;
class TDF_Tool {
	public:
		%feature("autodoc", "1");
		~TDF_Tool();
		%feature("autodoc", "1");
		TDF_Tool();
		%feature("autodoc", "1");
		Standard_Integer NbLabels(const TDF_Label &aLabel);
		%feature("autodoc", "1");
		Standard_Integer NbAttributes(const TDF_Label &aLabel);
		%feature("autodoc", "1");
		Standard_Integer NbAttributes(const TDF_Label &aLabel, const TDF_IDFilter &aFilter);
		%feature("autodoc", "1");
		Standard_Boolean IsSelfContained(const TDF_Label &aLabel);
		%feature("autodoc", "1");
		Standard_Boolean IsSelfContained(const TDF_Label &aLabel, const TDF_IDFilter &aFilter);
		%feature("autodoc", "1");
		void OutReferers(const TDF_Label &theLabel, TDF_AttributeMap & theAtts);
		%feature("autodoc", "1");
		void OutReferers(const TDF_Label &aLabel, const TDF_IDFilter &aFilterForReferers, const TDF_IDFilter &aFilterForReferences, TDF_AttributeMap & atts);
		%feature("autodoc", "1");
		void OutReferences(const TDF_Label &aLabel, TDF_AttributeMap & atts);
		%feature("autodoc", "1");
		void OutReferences(const TDF_Label &aLabel, const TDF_IDFilter &aFilterForReferers, const TDF_IDFilter &aFilterForReferences, TDF_AttributeMap & atts);
		%feature("autodoc", "1");
		void RelocateLabel(const TDF_Label &aSourceLabel, const TDF_Label &fromRoot, const TDF_Label &toRoot, TDF_Label & aTargetLabel, const Standard_Boolean create=0);
		%feature("autodoc", "1");
		void Entry(const TDF_Label &aLabel, TCollection_AsciiString & anEntry);
		%feature("autodoc", "1");
		void TagList(const TDF_Label &aLabel, TColStd_ListOfInteger & aTagList);
		%feature("autodoc", "1");
		void TagList(const TCollection_AsciiString &anEntry, TColStd_ListOfInteger & aTagList);
		%feature("autodoc", "1");
		void Label(const Handle_TDF_Data &aDF, const TCollection_AsciiString &anEntry, TDF_Label & aLabel, const Standard_Boolean create=0);
		%feature("autodoc", "1");
		void Label(const Handle_TDF_Data &aDF, const char * anEntry, TDF_Label & aLabel, const Standard_Boolean create=0);
		%feature("autodoc", "1");
		void Label(const Handle_TDF_Data &aDF, const TColStd_ListOfInteger &aTagList, TDF_Label & aLabel, const Standard_Boolean create=0);
		%feature("autodoc", "1");
		void CountLabels(TDF_LabelList & aLabelList, TDF_LabelIntegerMap & aLabelMap);
		%feature("autodoc", "1");
		void DeductLabels(TDF_LabelList & aLabelList, TDF_LabelIntegerMap & aLabelMap);
		%feature("autodoc", "1");
		void DeepDump(Standard_OStream & anOS, const Handle_TDF_Data &aDF);
		%feature("autodoc", "1");
		void ExtendedDeepDump(Standard_OStream & anOS, const Handle_TDF_Data &aDF, const TDF_IDFilter &aFilter);
		%feature("autodoc", "1");
		void DeepDump(Standard_OStream & anOS, const TDF_Label &aLabel);
		%feature("autodoc", "1");
		void ExtendedDeepDump(Standard_OStream & anOS, const TDF_Label &aLabel, const TDF_IDFilter &aFilter);

};

%nodefaultctor TDF_DeltaOnResume;
class TDF_DeltaOnResume : public TDF_AttributeDelta {
	public:
		%feature("autodoc", "1");
		TDF_DeltaOnResume(const Handle_TDF_Attribute &anAtt);
		%feature("autodoc", "1");
		virtual		void Apply();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DeltaOnResume();

};
%extend TDF_DeltaOnResume {
	Handle_TDF_DeltaOnResume GetHandle() {
	return *(Handle_TDF_DeltaOnResume*) &$self;
	}
};

%nodefaultctor TDF_LabelLabelMap;
class TDF_LabelLabelMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_LabelLabelMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_LabelLabelMap & Assign(const TDF_LabelLabelMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_LabelLabelMap();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const TDF_Label &K, const TDF_Label &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const TDF_Label &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const TDF_Label &K);
		%feature("autodoc", "1");
		const TDF_Label & Find(const TDF_Label &K) const;
		%feature("autodoc", "1");
		const TDF_Label & operator()(const TDF_Label &K) const;
		%feature("autodoc", "1");
		TDF_Label & ChangeFind(const TDF_Label &K);
		%feature("autodoc", "1");
		TDF_Label & operator()(const TDF_Label &K);

};

%nodefaultctor TDF_DataSet;
class TDF_DataSet : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TDF_DataSet();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void AddLabel(const TDF_Label &aLabel);
		%feature("autodoc", "1");
		Standard_Boolean ContainsLabel(const TDF_Label &aLabel) const;
		%feature("autodoc", "1");
		TDF_LabelMap & Labels();
		%feature("autodoc", "1");
		void AddAttribute(const Handle_TDF_Attribute &anAttribute);
		%feature("autodoc", "1");
		Standard_Boolean ContainsAttribute(const Handle_TDF_Attribute &anAttribute) const;
		%feature("autodoc", "1");
		TDF_AttributeMap & Attributes();
		%feature("autodoc", "1");
		void AddRoot(const TDF_Label &aLabel);
		%feature("autodoc", "1");
		TDF_LabelList & Roots();
		%feature("autodoc", "1");
		Standard_OStream & Dump(Standard_OStream & anOS) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DataSet();

};
%extend TDF_DataSet {
	Handle_TDF_DataSet GetHandle() {
	return *(Handle_TDF_DataSet*) &$self;
	}
};

%nodefaultctor TDF_ListIteratorOfAttributeList;
class TDF_ListIteratorOfAttributeList {
	public:
		%feature("autodoc", "1");
		~TDF_ListIteratorOfAttributeList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfAttributeList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfAttributeList(const TDF_AttributeList &L);
		%feature("autodoc", "1");
		void Initialize(const TDF_AttributeList &L);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Value() const;

};

%nodefaultctor TDF_StdMapNodeOfLabelMap;
class TDF_StdMapNodeOfLabelMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_StdMapNodeOfLabelMap(const TDF_Label &K, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TDF_Label & Key() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_StdMapNodeOfLabelMap();

};
%extend TDF_StdMapNodeOfLabelMap {
	Handle_TDF_StdMapNodeOfLabelMap GetHandle() {
	return *(Handle_TDF_StdMapNodeOfLabelMap*) &$self;
	}
};

%nodefaultctor TDF_ListIteratorOfDeltaList;
class TDF_ListIteratorOfDeltaList {
	public:
		%feature("autodoc", "1");
		~TDF_ListIteratorOfDeltaList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfDeltaList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfDeltaList(const TDF_DeltaList &L);
		%feature("autodoc", "1");
		void Initialize(const TDF_DeltaList &L);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		Handle_TDF_Delta & Value() const;

};

%nodefaultctor TDF_AttributeIterator;
class TDF_AttributeIterator {
	public:
		%feature("autodoc", "1");
		~TDF_AttributeIterator();
		%feature("autodoc", "1");
		TDF_AttributeIterator();
		%feature("autodoc", "1");
		TDF_AttributeIterator(const TDF_Label &aLabel, const Standard_Boolean withoutForgotten=1);
		%feature("autodoc", "1");
		TDF_AttributeIterator(const TDF_LabelNodePtr aLabelNode, const Standard_Boolean withoutForgotten=1);
		%feature("autodoc", "1");
		void Initialize(const TDF_Label &aLabel, const Standard_Boolean withoutForgotten=1);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		TDF_Attribute * Value() const;

};

%nodefaultctor TDF_LabelDoubleMap;
class TDF_LabelDoubleMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_LabelDoubleMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_LabelDoubleMap & Assign(const TDF_LabelDoubleMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_LabelDoubleMap();
		%feature("autodoc", "1");
		void Bind(const TDF_Label &K1, const TDF_Label &K2);
		%feature("autodoc", "1");
		Standard_Boolean AreBound(const TDF_Label &K1, const TDF_Label &K2) const;
		%feature("autodoc", "1");
		Standard_Boolean IsBound1(const TDF_Label &K) const;
		%feature("autodoc", "1");
		Standard_Boolean IsBound2(const TDF_Label &K) const;
		%feature("autodoc", "1");
		const TDF_Label & Find1(const TDF_Label &K) const;
		%feature("autodoc", "1");
		const TDF_Label & Find2(const TDF_Label &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind1(const TDF_Label &K);
		%feature("autodoc", "1");
		Standard_Boolean UnBind2(const TDF_Label &K);

};

%nodefaultctor TDF_DataMapNodeOfLabelDataMap;
class TDF_DataMapNodeOfLabelDataMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_DataMapNodeOfLabelDataMap(const TDF_Label &K, const TDF_Label &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TDF_Label & Key() const;
		%feature("autodoc", "1");
		TDF_Label & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DataMapNodeOfLabelDataMap();

};
%extend TDF_DataMapNodeOfLabelDataMap {
	Handle_TDF_DataMapNodeOfLabelDataMap GetHandle() {
	return *(Handle_TDF_DataMapNodeOfLabelDataMap*) &$self;
	}
};

%nodefaultctor TDF_DataMapNodeOfLabelIntegerMap;
class TDF_DataMapNodeOfLabelIntegerMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_DataMapNodeOfLabelIntegerMap(const TDF_Label &K, const Standard_Integer &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TDF_Label & Key() const;
		%feature("autodoc", "1");
		Standard_Integer & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_DataMapNodeOfLabelIntegerMap();

};
%extend TDF_DataMapNodeOfLabelIntegerMap {
	Handle_TDF_DataMapNodeOfLabelIntegerMap GetHandle() {
	return *(Handle_TDF_DataMapNodeOfLabelIntegerMap*) &$self;
	}
};

%nodefaultctor TDF_SequenceNodeOfAttributeSequence;
class TDF_SequenceNodeOfAttributeSequence : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		TDF_SequenceNodeOfAttributeSequence(const Handle_TDF_Attribute &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_SequenceNodeOfAttributeSequence();

};
%extend TDF_SequenceNodeOfAttributeSequence {
	Handle_TDF_SequenceNodeOfAttributeSequence GetHandle() {
	return *(Handle_TDF_SequenceNodeOfAttributeSequence*) &$self;
	}
};

%nodefaultctor TDF_AttributeArray1;
class TDF_AttributeArray1 {
	public:
		%feature("autodoc", "1");
		TDF_AttributeArray1(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TDF_AttributeArray1(const Handle_TDF_Attribute &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Handle_TDF_Attribute &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TDF_AttributeArray1();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const TDF_AttributeArray1 & Assign(const TDF_AttributeArray1 &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_TDF_Attribute &Value);
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_TDF_Attribute & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & operator()(const Standard_Integer Index);

};

%nodefaultctor TDF_DoubleMapIteratorOfAttributeDoubleMap;
class TDF_DoubleMapIteratorOfAttributeDoubleMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_DoubleMapIteratorOfAttributeDoubleMap();
		%feature("autodoc", "1");
		TDF_DoubleMapIteratorOfAttributeDoubleMap();
		%feature("autodoc", "1");
		TDF_DoubleMapIteratorOfAttributeDoubleMap(const TDF_AttributeDoubleMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_AttributeDoubleMap &aMap);
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Key1() const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Key2() const;

};

%nodefaultctor TDF_IDMap;
class TDF_IDMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_IDMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_IDMap & Assign(const TDF_IDMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_IDMap();
		%feature("autodoc", "1");
		Standard_Boolean Add(const Standard_GUID &aKey);
		%feature("autodoc", "1");
		Standard_Boolean Contains(const Standard_GUID &aKey) const;
		%feature("autodoc", "1");
		Standard_Boolean Remove(const Standard_GUID &aKey);

};

%nodefaultctor TDF_ListNodeOfLabelList;
class TDF_ListNodeOfLabelList : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_ListNodeOfLabelList(const TDF_Label &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TDF_Label & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_ListNodeOfLabelList();

};
%extend TDF_ListNodeOfLabelList {
	Handle_TDF_ListNodeOfLabelList GetHandle() {
	return *(Handle_TDF_ListNodeOfLabelList*) &$self;
	}
};

%nodefaultctor TDF_StdMapNodeOfAttributeMap;
class TDF_StdMapNodeOfAttributeMap : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_StdMapNodeOfAttributeMap(const Handle_TDF_Attribute &K, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Key() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_StdMapNodeOfAttributeMap();

};
%extend TDF_StdMapNodeOfAttributeMap {
	Handle_TDF_StdMapNodeOfAttributeMap GetHandle() {
	return *(Handle_TDF_StdMapNodeOfAttributeMap*) &$self;
	}
};

%nodefaultctor TDF_CopyLabel;
class TDF_CopyLabel {
	public:
		%feature("autodoc", "1");
		~TDF_CopyLabel();
		%feature("autodoc", "1");
		TDF_CopyLabel();
		%feature("autodoc", "1");
		TDF_CopyLabel(const TDF_Label &aSource, const TDF_Label &aTarget);
		%feature("autodoc", "1");
		void Load(const TDF_Label &aSource, const TDF_Label &aTarget);
		%feature("autodoc", "1");
		void UseFilter(const TDF_IDFilter &aFilter);
		%feature("autodoc", "1");
		Standard_Boolean ExternalReferences(const TDF_Label &Lab, TDF_AttributeMap & aExternals, const TDF_IDFilter &aFilter);
		%feature("autodoc", "1");
		void ExternalReferences(const TDF_Label &aRefLab, const TDF_Label &Lab, TDF_AttributeMap & aExternals, const TDF_IDFilter &aFilter, Handle_TDF_DataSet & aDataSet);
		%feature("autodoc", "1");
		void Perform();
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		const Handle_TDF_RelocationTable & RelocationTable() const;

};

%nodefaultctor TDF_Transaction;
class TDF_Transaction {
	public:
		%feature("autodoc", "1");
		TDF_Transaction(const TCollection_AsciiString &aName="");
		%feature("autodoc", "1");
		TDF_Transaction(const Handle_TDF_Data &aDF, const TCollection_AsciiString &aName="");
		%feature("autodoc", "1");
		void Initialize(const Handle_TDF_Data &aDF);
		%feature("autodoc", "1");
		Standard_Integer Open();
		%feature("autodoc", "1");
		Handle_TDF_Delta Commit(const Standard_Boolean withDelta=0);
		%feature("autodoc", "1");
		void Abort();
		%feature("autodoc", "1");
		~TDF_Transaction();
		%feature("autodoc", "1");
		Handle_TDF_Data Data() const;
		%feature("autodoc", "1");
		Standard_Integer Transaction() const;
		%feature("autodoc", "1");
		const TCollection_AsciiString & Name() const;
		%feature("autodoc", "1");
		Standard_Boolean IsOpen() const;

};

%nodefaultctor TDF_ListIteratorOfLabelList;
class TDF_ListIteratorOfLabelList {
	public:
		%feature("autodoc", "1");
		~TDF_ListIteratorOfLabelList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfLabelList();
		%feature("autodoc", "1");
		TDF_ListIteratorOfLabelList(const TDF_LabelList &L);
		%feature("autodoc", "1");
		void Initialize(const TDF_LabelList &L);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		TDF_Label & Value() const;

};

%nodefaultctor TDF_ChildIterator;
class TDF_ChildIterator {
	public:
		%feature("autodoc", "1");
		~TDF_ChildIterator();
		%feature("autodoc", "1");
		TDF_ChildIterator();
		%feature("autodoc", "1");
		TDF_ChildIterator(const TDF_Label &aLabel, const Standard_Boolean allLevels=0);
		%feature("autodoc", "1");
		void Initialize(const TDF_Label &aLabel, const Standard_Boolean allLevels=0);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		void NextBrother();
		%feature("autodoc", "1");
		TDF_Label const Value() const;

};

%nodefaultctor TDF_AttributeDeltaList;
class TDF_AttributeDeltaList {
	public:
		%feature("autodoc", "1");
		TDF_AttributeDeltaList();
		%feature("autodoc", "1");
		void Assign(const TDF_AttributeDeltaList &Other);
		%feature("autodoc", "1");
		Standard_Integer Extent() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_AttributeDeltaList();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void Prepend(const Handle_TDF_AttributeDelta &I);
		%feature("autodoc", "1");
		void Prepend(const Handle_TDF_AttributeDelta &I, TDF_ListIteratorOfAttributeDeltaList & theIt);
		%feature("autodoc", "1");
		void Prepend(TDF_AttributeDeltaList & Other);
		%feature("autodoc", "1");
		void Append(const Handle_TDF_AttributeDelta &I);
		%feature("autodoc", "1");
		void Append(const Handle_TDF_AttributeDelta &I, TDF_ListIteratorOfAttributeDeltaList & theIt);
		%feature("autodoc", "1");
		void Append(TDF_AttributeDeltaList & Other);
		%feature("autodoc", "1");
		Handle_TDF_AttributeDelta & First() const;
		%feature("autodoc", "1");
		Handle_TDF_AttributeDelta & Last() const;
		%feature("autodoc", "1");
		void RemoveFirst();
		%feature("autodoc", "1");
		void Remove(TDF_ListIteratorOfAttributeDeltaList & It);
		%feature("autodoc", "1");
		void InsertBefore(const Handle_TDF_AttributeDelta &I, TDF_ListIteratorOfAttributeDeltaList & It);
		%feature("autodoc", "1");
		void InsertBefore(TDF_AttributeDeltaList & Other, TDF_ListIteratorOfAttributeDeltaList & It);
		%feature("autodoc", "1");
		void InsertAfter(const Handle_TDF_AttributeDelta &I, TDF_ListIteratorOfAttributeDeltaList & It);
		%feature("autodoc", "1");
		void InsertAfter(TDF_AttributeDeltaList & Other, TDF_ListIteratorOfAttributeDeltaList & It);

};

%nodefaultctor TDF_HAttributeArray1;
class TDF_HAttributeArray1 : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TDF_HAttributeArray1(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TDF_HAttributeArray1(const Standard_Integer Low, const Standard_Integer Up, const Handle_TDF_Attribute &V);
		%feature("autodoc", "1");
		void Init(const Handle_TDF_Attribute &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Handle_TDF_Attribute &Value);
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Handle_TDF_Attribute & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const TDF_AttributeArray1 & Array1() const;
		%feature("autodoc", "1");
		TDF_AttributeArray1 & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_HAttributeArray1();

};
%extend TDF_HAttributeArray1 {
	Handle_TDF_HAttributeArray1 GetHandle() {
	return *(Handle_TDF_HAttributeArray1*) &$self;
	}
};

%nodefaultctor TDF_RelocationTable;
class TDF_RelocationTable : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TDF_RelocationTable(const Standard_Boolean selfRelocate=0);
		%feature("autodoc", "1");
		void SelfRelocate(const Standard_Boolean selfRelocate);
		%feature("autodoc", "1");
		Standard_Boolean SelfRelocate() const;
		%feature("autodoc", "1");
		void AfterRelocate(const Standard_Boolean afterRelocate);
		%feature("autodoc", "1");
		Standard_Boolean AfterRelocate() const;
		%feature("autodoc", "1");
		void SetRelocation(const TDF_Label &aSourceLabel, const TDF_Label &aTargetLabel);
		%feature("autodoc", "1");
		Standard_Boolean HasRelocation(const TDF_Label &aSourceLabel, TDF_Label & aTargetLabel) const;
		%feature("autodoc", "1");
		void SetRelocation(const Handle_TDF_Attribute &aSourceAttribute, const Handle_TDF_Attribute &aTargetAttribute);
		%feature("autodoc", "1");
		Standard_Boolean HasRelocation(const Handle_TDF_Attribute &aSourceAttribute, Handle_TDF_Attribute & aTargetAttribute) const;
		%feature("autodoc", "1");
		void SetTransientRelocation(const Handle_Standard_Transient &aSourceTransient, const Handle_Standard_Transient &aTargetTransient);
		%feature("autodoc", "1");
		Standard_Boolean HasTransientRelocation(const Handle_Standard_Transient &aSourceTransient, Handle_Standard_Transient & aTargetTransient) const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void TargetLabelMap(TDF_LabelMap & aLabelMap) const;
		%feature("autodoc", "1");
		void TargetAttributeMap(TDF_AttributeMap & anAttributeMap) const;
		%feature("autodoc", "1");
		TDF_LabelDataMap & LabelTable();
		%feature("autodoc", "1");
		TDF_AttributeDataMap & AttributeTable();
		%feature("autodoc", "1");
		TColStd_IndexedDataMapOfTransientTransient & TransientTable();
		%feature("autodoc", "1");
		Standard_OStream & Dump(const Standard_Boolean dumpLabels, const Standard_Boolean dumpAttributes, const Standard_Boolean dumpTransients, Standard_OStream & anOS) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_RelocationTable();

};
%extend TDF_RelocationTable {
	Handle_TDF_RelocationTable GetHandle() {
	return *(Handle_TDF_RelocationTable*) &$self;
	}
};

%nodefaultctor TDF_AttributeIndexedMap;
class TDF_AttributeIndexedMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_AttributeIndexedMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_AttributeIndexedMap & Assign(const TDF_AttributeIndexedMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_AttributeIndexedMap();
		%feature("autodoc", "1");
		Standard_Integer Add(const Handle_TDF_Attribute &K);
		%feature("autodoc", "1");
		void Substitute(const Standard_Integer I, const Handle_TDF_Attribute &K);
		%feature("autodoc", "1");
		void RemoveLast();
		%feature("autodoc", "1");
		Standard_Boolean Contains(const Handle_TDF_Attribute &K) const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & FindKey(const Standard_Integer I) const;
		%feature("autodoc", "1");
		const Handle_TDF_Attribute & operator()(const Standard_Integer I) const;
		%feature("autodoc", "1");
		Standard_Integer FindIndex(const Handle_TDF_Attribute &K) const;

};

%nodefaultctor TDF;
class TDF {
	public:
		%feature("autodoc", "1");
		~TDF();
		%feature("autodoc", "1");
		TDF();
		%feature("autodoc", "1");
		const Standard_GUID & LowestID();
		%feature("autodoc", "1");
		const Standard_GUID & UppestID();
		%feature("autodoc", "1");
		void AddLinkGUIDToProgID(const Standard_GUID &ID, const TCollection_ExtendedString &ProgID);
		%feature("autodoc", "1");
		Standard_Boolean GUIDFromProgID(const TCollection_ExtendedString &ProgID, Standard_GUID & ID);
		%feature("autodoc", "1");
		Standard_Boolean ProgIDFromGUID(const Standard_GUID &ID, TCollection_ExtendedString & ProgID);

};

%nodefaultctor TDF_ListNodeOfAttributeList;
class TDF_ListNodeOfAttributeList : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TDF_ListNodeOfAttributeList(const Handle_TDF_Attribute &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		Handle_TDF_Attribute & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_ListNodeOfAttributeList();

};
%extend TDF_ListNodeOfAttributeList {
	Handle_TDF_ListNodeOfAttributeList GetHandle() {
	return *(Handle_TDF_ListNodeOfAttributeList*) &$self;
	}
};

%nodefaultctor TDF_LabelIntegerMap;
class TDF_LabelIntegerMap : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TDF_LabelIntegerMap(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TDF_LabelIntegerMap & Assign(const TDF_LabelIntegerMap &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TDF_LabelIntegerMap();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const TDF_Label &K, const Standard_Integer &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const TDF_Label &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const TDF_Label &K);
		%feature("autodoc", "1");
		const Standard_Integer & Find(const TDF_Label &K) const;
		%feature("autodoc", "1");
		const Standard_Integer & operator()(const TDF_Label &K) const;
		%feature("autodoc", "1");
		Standard_Integer & ChangeFind(const TDF_Label &K);
		%feature("autodoc", "1");
		Standard_Integer & operator()(const TDF_Label &K);

};

%nodefaultctor TDF_Reference;
class TDF_Reference : public TDF_Attribute {
	public:
		%feature("autodoc", "1");
		const Standard_GUID & GetID();
		%feature("autodoc", "1");
		Handle_TDF_Reference Set(const TDF_Label &I, const TDF_Label &Origin);
		%feature("autodoc", "1");
		void Set(const TDF_Label &Origin);
		%feature("autodoc", "1");
		TDF_Label Get() const;
		%feature("autodoc", "1");
		virtual		const Standard_GUID & ID() const;
		%feature("autodoc", "1");
		virtual		void Restore(const Handle_TDF_Attribute &With);
		%feature("autodoc", "1");
		virtual		Handle_TDF_Attribute NewEmpty() const;
		%feature("autodoc", "1");
		virtual		void Paste(const Handle_TDF_Attribute &Into, const Handle_TDF_RelocationTable &RT) const;
		%feature("autodoc", "1");
		virtual		void References(const Handle_TDF_DataSet &DS) const;
		%feature("autodoc", "1");
		virtual		Standard_OStream & Dump(Standard_OStream & anOS) const;
		%feature("autodoc", "1");
		TDF_Reference();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_Reference();

};
%extend TDF_Reference {
	Handle_TDF_Reference GetHandle() {
	return *(Handle_TDF_Reference*) &$self;
	}
};

%nodefaultctor TDF_Delta;
class TDF_Delta : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TDF_Delta();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		Standard_Boolean IsApplicable(const Standard_Integer aCurrentTime) const;
		%feature("autodoc", "1");
		Standard_Integer BeginTime() const;
		%feature("autodoc", "1");
		Standard_Integer EndTime() const;
		%feature("autodoc", "1");
		void Labels(TDF_LabelList & aLabelList) const;
		%feature("autodoc", "1");
		const TDF_AttributeDeltaList & AttributeDeltas() const;
		%feature("autodoc", "1");
		TCollection_ExtendedString Name() const;
		%feature("autodoc", "1");
		void SetName(const TCollection_ExtendedString &theName);
		%feature("autodoc", "1");
		void Dump(Standard_OStream & OS) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TDF_Delta();

};
%extend TDF_Delta {
	Handle_TDF_Delta GetHandle() {
	return *(Handle_TDF_Delta*) &$self;
	}
};

%nodefaultctor TDF_ComparisonTool;
class TDF_ComparisonTool {
	public:
		%feature("autodoc", "1");
		~TDF_ComparisonTool();
		%feature("autodoc", "1");
		TDF_ComparisonTool();
		%feature("autodoc", "1");
		void Compare(const Handle_TDF_DataSet &aSourceDataSet, const Handle_TDF_DataSet &aTargetDataSet, const TDF_IDFilter &aFilter, const Handle_TDF_RelocationTable &aRelocationTable);
		%feature("autodoc", "1");
		Standard_Boolean SourceUnbound(const Handle_TDF_DataSet &aRefDataSet, const Handle_TDF_RelocationTable &aRelocationTable, const TDF_IDFilter &aFilter, const Handle_TDF_DataSet &aDiffDataSet, const Standard_Integer anOption=2);
		%feature("autodoc", "1");
		Standard_Boolean TargetUnbound(const Handle_TDF_DataSet &aRefDataSet, const Handle_TDF_RelocationTable &aRelocationTable, const TDF_IDFilter &aFilter, const Handle_TDF_DataSet &aDiffDataSet, const Standard_Integer anOption=2);
		%feature("autodoc", "1");
		void Cut(const Handle_TDF_DataSet &aDataSet);
		%feature("autodoc", "1");
		Standard_Boolean IsSelfContained(const TDF_Label &aLabel, const Handle_TDF_DataSet &aDataSet);

};

%nodefaultctor TDF_ClosureTool;
class TDF_ClosureTool {
	public:
		%feature("autodoc", "1");
		~TDF_ClosureTool();
		%feature("autodoc", "1");
		TDF_ClosureTool();
		%feature("autodoc", "1");
		void Closure(const Handle_TDF_DataSet &aDataSet);
		%feature("autodoc", "1");
		void Closure(const Handle_TDF_DataSet &aDataSet, const TDF_IDFilter &aFilter, const TDF_ClosureMode &aMode);
		%feature("autodoc", "1");
		void Closure(const TDF_Label &aLabel, TDF_LabelMap & aLabMap, TDF_AttributeMap & anAttMap, const TDF_IDFilter &aFilter, const TDF_ClosureMode &aMode);

};

%nodefaultctor TDF_DoubleMapIteratorOfLabelDoubleMap;
class TDF_DoubleMapIteratorOfLabelDoubleMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_DoubleMapIteratorOfLabelDoubleMap();
		%feature("autodoc", "1");
		TDF_DoubleMapIteratorOfLabelDoubleMap();
		%feature("autodoc", "1");
		TDF_DoubleMapIteratorOfLabelDoubleMap(const TDF_LabelDoubleMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_LabelDoubleMap &aMap);
		%feature("autodoc", "1");
		const TDF_Label & Key1() const;
		%feature("autodoc", "1");
		const TDF_Label & Key2() const;

};

%nodefaultctor TDF_DataMapIteratorOfLabelDataMap;
class TDF_DataMapIteratorOfLabelDataMap : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TDF_DataMapIteratorOfLabelDataMap();
		%feature("autodoc", "1");
		TDF_DataMapIteratorOfLabelDataMap();
		%feature("autodoc", "1");
		TDF_DataMapIteratorOfLabelDataMap(const TDF_LabelDataMap &aMap);
		%feature("autodoc", "1");
		void Initialize(const TDF_LabelDataMap &aMap);
		%feature("autodoc", "1");
		const TDF_Label & Key() const;
		%feature("autodoc", "1");
		const TDF_Label & Value() const;

};