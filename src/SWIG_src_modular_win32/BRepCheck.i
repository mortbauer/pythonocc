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
%module BRepCheck

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


%include BRepCheck_dependencies.i


%include BRepCheck_headers.i


enum BRepCheck_Status {
	BRepCheck_NoError,
	BRepCheck_InvalidPointOnCurve,
	BRepCheck_InvalidPointOnCurveOnSurface,
	BRepCheck_InvalidPointOnSurface,
	BRepCheck_No3DCurve,
	BRepCheck_Multiple3DCurve,
	BRepCheck_Invalid3DCurve,
	BRepCheck_NoCurveOnSurface,
	BRepCheck_InvalidCurveOnSurface,
	BRepCheck_InvalidCurveOnClosedSurface,
	BRepCheck_InvalidSameRangeFlag,
	BRepCheck_InvalidSameParameterFlag,
	BRepCheck_InvalidDegeneratedFlag,
	BRepCheck_FreeEdge,
	BRepCheck_InvalidMultiConnexity,
	BRepCheck_InvalidRange,
	BRepCheck_EmptyWire,
	BRepCheck_RedundantEdge,
	BRepCheck_SelfIntersectingWire,
	BRepCheck_NoSurface,
	BRepCheck_InvalidWire,
	BRepCheck_RedundantWire,
	BRepCheck_IntersectingWires,
	BRepCheck_InvalidImbricationOfWires,
	BRepCheck_EmptyShell,
	BRepCheck_RedundantFace,
	BRepCheck_UnorientableShape,
	BRepCheck_NotClosed,
	BRepCheck_NotConnected,
	BRepCheck_SubshapeNotInShape,
	BRepCheck_BadOrientation,
	BRepCheck_BadOrientationOfSubshape,
	BRepCheck_InvalidToleranceValue,
	BRepCheck_CheckFail,
	};



%nodefaultctor Handle_BRepCheck_Result;
class Handle_BRepCheck_Result : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_BRepCheck_Result();
		%feature("autodoc", "1");
		Handle_BRepCheck_Result();
		%feature("autodoc", "1");
		Handle_BRepCheck_Result(const Handle_BRepCheck_Result &aHandle);
		%feature("autodoc", "1");
		Handle_BRepCheck_Result(const BRepCheck_Result *anItem);
		%feature("autodoc", "1");
		Handle_BRepCheck_Result const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Result {
	BRepCheck_Result* GetObject() {
	return (BRepCheck_Result*)$self->Access();
	}
};

%nodefaultctor Handle_BRepCheck_Shell;
class Handle_BRepCheck_Shell : public Handle_BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		~Handle_BRepCheck_Shell();
		%feature("autodoc", "1");
		Handle_BRepCheck_Shell();
		%feature("autodoc", "1");
		Handle_BRepCheck_Shell(const Handle_BRepCheck_Shell &aHandle);
		%feature("autodoc", "1");
		Handle_BRepCheck_Shell(const BRepCheck_Shell *anItem);
		%feature("autodoc", "1");
		Handle_BRepCheck_Shell const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Shell {
	BRepCheck_Shell* GetObject() {
	return (BRepCheck_Shell*)$self->Access();
	}
};

%nodefaultctor Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult;
class Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult();
		%feature("autodoc", "1");
		Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult();
		%feature("autodoc", "1");
		Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult(const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult &aHandle);
		%feature("autodoc", "1");
		Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult(const BRepCheck_DataMapNodeOfDataMapOfShapeResult *anItem);
		%feature("autodoc", "1");
		Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult {
	BRepCheck_DataMapNodeOfDataMapOfShapeResult* GetObject() {
	return (BRepCheck_DataMapNodeOfDataMapOfShapeResult*)$self->Access();
	}
};

%nodefaultctor Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus;
class Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus();
		%feature("autodoc", "1");
		Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus();
		%feature("autodoc", "1");
		Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus(const Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus &aHandle);
		%feature("autodoc", "1");
		Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus(const BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus *anItem);
		%feature("autodoc", "1");
		Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
	BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus* GetObject() {
	return (BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus*)$self->Access();
	}
};

%nodefaultctor Handle_BRepCheck_Wire;
class Handle_BRepCheck_Wire : public Handle_BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		~Handle_BRepCheck_Wire();
		%feature("autodoc", "1");
		Handle_BRepCheck_Wire();
		%feature("autodoc", "1");
		Handle_BRepCheck_Wire(const Handle_BRepCheck_Wire &aHandle);
		%feature("autodoc", "1");
		Handle_BRepCheck_Wire(const BRepCheck_Wire *anItem);
		%feature("autodoc", "1");
		Handle_BRepCheck_Wire const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Wire {
	BRepCheck_Wire* GetObject() {
	return (BRepCheck_Wire*)$self->Access();
	}
};

%nodefaultctor Handle_BRepCheck_ListNodeOfListOfStatus;
class Handle_BRepCheck_ListNodeOfListOfStatus : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_BRepCheck_ListNodeOfListOfStatus();
		%feature("autodoc", "1");
		Handle_BRepCheck_ListNodeOfListOfStatus();
		%feature("autodoc", "1");
		Handle_BRepCheck_ListNodeOfListOfStatus(const Handle_BRepCheck_ListNodeOfListOfStatus &aHandle);
		%feature("autodoc", "1");
		Handle_BRepCheck_ListNodeOfListOfStatus(const BRepCheck_ListNodeOfListOfStatus *anItem);
		%feature("autodoc", "1");
		Handle_BRepCheck_ListNodeOfListOfStatus const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_ListNodeOfListOfStatus {
	BRepCheck_ListNodeOfListOfStatus* GetObject() {
	return (BRepCheck_ListNodeOfListOfStatus*)$self->Access();
	}
};

%nodefaultctor Handle_BRepCheck_Edge;
class Handle_BRepCheck_Edge : public Handle_BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		~Handle_BRepCheck_Edge();
		%feature("autodoc", "1");
		Handle_BRepCheck_Edge();
		%feature("autodoc", "1");
		Handle_BRepCheck_Edge(const Handle_BRepCheck_Edge &aHandle);
		%feature("autodoc", "1");
		Handle_BRepCheck_Edge(const BRepCheck_Edge *anItem);
		%feature("autodoc", "1");
		Handle_BRepCheck_Edge const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Edge {
	BRepCheck_Edge* GetObject() {
	return (BRepCheck_Edge*)$self->Access();
	}
};

%nodefaultctor Handle_BRepCheck_Vertex;
class Handle_BRepCheck_Vertex : public Handle_BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		~Handle_BRepCheck_Vertex();
		%feature("autodoc", "1");
		Handle_BRepCheck_Vertex();
		%feature("autodoc", "1");
		Handle_BRepCheck_Vertex(const Handle_BRepCheck_Vertex &aHandle);
		%feature("autodoc", "1");
		Handle_BRepCheck_Vertex(const BRepCheck_Vertex *anItem);
		%feature("autodoc", "1");
		Handle_BRepCheck_Vertex const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Vertex {
	BRepCheck_Vertex* GetObject() {
	return (BRepCheck_Vertex*)$self->Access();
	}
};

%nodefaultctor Handle_BRepCheck_Face;
class Handle_BRepCheck_Face : public Handle_BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		~Handle_BRepCheck_Face();
		%feature("autodoc", "1");
		Handle_BRepCheck_Face();
		%feature("autodoc", "1");
		Handle_BRepCheck_Face(const Handle_BRepCheck_Face &aHandle);
		%feature("autodoc", "1");
		Handle_BRepCheck_Face(const BRepCheck_Face *anItem);
		%feature("autodoc", "1");
		Handle_BRepCheck_Face const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepCheck_Face {
	BRepCheck_Face* GetObject() {
	return (BRepCheck_Face*)$self->Access();
	}
};

%nodefaultctor BRepCheck_ListNodeOfListOfStatus;
class BRepCheck_ListNodeOfListOfStatus : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		BRepCheck_ListNodeOfListOfStatus(const BRepCheck_Status &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		BRepCheck_Status & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepCheck_ListNodeOfListOfStatus();

};
%extend BRepCheck_ListNodeOfListOfStatus {
	Handle_BRepCheck_ListNodeOfListOfStatus GetHandle() {
	return *(Handle_BRepCheck_ListNodeOfListOfStatus*) &$self;
	}
};

%nodefaultctor BRepCheck_DataMapOfShapeListOfStatus;
class BRepCheck_DataMapOfShapeListOfStatus : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		BRepCheck_DataMapOfShapeListOfStatus(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		BRepCheck_DataMapOfShapeListOfStatus & Assign(const BRepCheck_DataMapOfShapeListOfStatus &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~BRepCheck_DataMapOfShapeListOfStatus();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const TopoDS_Shape &K, const BRepCheck_ListOfStatus &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const TopoDS_Shape &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const TopoDS_Shape &K);
		%feature("autodoc", "1");
		const BRepCheck_ListOfStatus & Find(const TopoDS_Shape &K) const;
		%feature("autodoc", "1");
		const BRepCheck_ListOfStatus & operator()(const TopoDS_Shape &K) const;
		%feature("autodoc", "1");
		BRepCheck_ListOfStatus & ChangeFind(const TopoDS_Shape &K);
		%feature("autodoc", "1");
		BRepCheck_ListOfStatus & operator()(const TopoDS_Shape &K);

};

%nodefaultctor BRepCheck_Result;
class BRepCheck_Result : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		virtual		void InContext(const TopoDS_Shape &ContextShape);
		%feature("autodoc", "1");
		virtual		void Minimum();
		%feature("autodoc", "1");
		virtual		void Blind();
		%feature("autodoc", "1");
		void SetFailStatus(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		const BRepCheck_ListOfStatus & Status() const;
		%feature("autodoc", "1");
		Standard_Boolean IsMinimum() const;
		%feature("autodoc", "1");
		Standard_Boolean IsBlind() const;
		%feature("autodoc", "1");
		const BRepCheck_ListOfStatus & StatusOnShape(const TopoDS_Shape &S);
		%feature("autodoc", "1");
		void InitContextIterator();
		%feature("autodoc", "1");
		Standard_Boolean MoreShapeInContext() const;
		%feature("autodoc", "1");
		const TopoDS_Shape & ContextualShape() const;
		%feature("autodoc", "1");
		const BRepCheck_ListOfStatus & StatusOnShape() const;
		%feature("autodoc", "1");
		void NextShapeInContext();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;

};
%extend BRepCheck_Result {
	Handle_BRepCheck_Result GetHandle() {
	return *(Handle_BRepCheck_Result*) &$self;
	}
};

%nodefaultctor BRepCheck_Shell;
class BRepCheck_Shell : public BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		BRepCheck_Shell(const TopoDS_Shell &S);
		%feature("autodoc", "1");
		BRepCheck_Status Closed(const Standard_Boolean Update=0);
		%feature("autodoc", "1");
		BRepCheck_Status Orientation(const Standard_Boolean Update=0);
		%feature("autodoc", "1");
		void SetUnorientable();
		%feature("autodoc", "1");
		Standard_Boolean IsUnorientable() const;
		%feature("autodoc", "1");
		Standard_Integer NbConnectedSet(TopTools_ListOfShape & theSets);
		%feature("autodoc", "1");
		virtual		~BRepCheck_Shell();

};
%extend BRepCheck_Shell {
	Handle_BRepCheck_Shell GetHandle() {
	return *(Handle_BRepCheck_Shell*) &$self;
	}
};

%nodefaultctor BRepCheck_DataMapIteratorOfDataMapOfShapeResult;
class BRepCheck_DataMapIteratorOfDataMapOfShapeResult : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~BRepCheck_DataMapIteratorOfDataMapOfShapeResult();
		%feature("autodoc", "1");
		BRepCheck_DataMapIteratorOfDataMapOfShapeResult();
		%feature("autodoc", "1");
		BRepCheck_DataMapIteratorOfDataMapOfShapeResult(const BRepCheck_DataMapOfShapeResult &aMap);
		%feature("autodoc", "1");
		void Initialize(const BRepCheck_DataMapOfShapeResult &aMap);
		%feature("autodoc", "1");
		const TopoDS_Shape & Key() const;
		%feature("autodoc", "1");
		const Handle_BRepCheck_Result & Value() const;

};

%nodefaultctor BRepCheck_Face;
class BRepCheck_Face : public BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		BRepCheck_Face(const TopoDS_Face &F);
		%feature("autodoc", "1");
		virtual		void InContext(const TopoDS_Shape &ContextShape);
		%feature("autodoc", "1");
		virtual		void Minimum();
		%feature("autodoc", "1");
		virtual		void Blind();
		%feature("autodoc", "1");
		BRepCheck_Status IntersectWires(const Standard_Boolean Update=0);
		%feature("autodoc", "1");
		BRepCheck_Status ClassifyWires(const Standard_Boolean Update=0);
		%feature("autodoc", "1");
		BRepCheck_Status OrientationOfWires(const Standard_Boolean Update=0);
		%feature("autodoc", "1");
		void SetUnorientable();
		%feature("autodoc", "1");
		Standard_Boolean IsUnorientable() const;
		%feature("autodoc", "1");
		Standard_Boolean GeometricControls() const;
		%feature("autodoc", "1");
		void GeometricControls(const Standard_Boolean B);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepCheck_Face();

};
%extend BRepCheck_Face {
	Handle_BRepCheck_Face GetHandle() {
	return *(Handle_BRepCheck_Face*) &$self;
	}
};

%nodefaultctor BRepCheck_DataMapNodeOfDataMapOfShapeResult;
class BRepCheck_DataMapNodeOfDataMapOfShapeResult : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		BRepCheck_DataMapNodeOfDataMapOfShapeResult(const TopoDS_Shape &K, const Handle_BRepCheck_Result &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TopoDS_Shape & Key() const;
		%feature("autodoc", "1");
		Handle_BRepCheck_Result & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepCheck_DataMapNodeOfDataMapOfShapeResult();

};
%extend BRepCheck_DataMapNodeOfDataMapOfShapeResult {
	Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult GetHandle() {
	return *(Handle_BRepCheck_DataMapNodeOfDataMapOfShapeResult*) &$self;
	}
};

%nodefaultctor BRepCheck;
class BRepCheck {
	public:
		%feature("autodoc", "1");
		~BRepCheck();
		%feature("autodoc", "1");
		BRepCheck();
		%feature("autodoc", "1");
		void Add(BRepCheck_ListOfStatus & List, const BRepCheck_Status Stat);
		%feature("autodoc", "1");
		void Print(const BRepCheck_Status Stat, Standard_OStream & OS);
		%feature("autodoc", "1");
		Standard_Boolean SelfIntersection(const TopoDS_Wire &W, const TopoDS_Face &F, TopoDS_Edge & E1, TopoDS_Edge & E2);

};

%nodefaultctor BRepCheck_Wire;
class BRepCheck_Wire : public BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		BRepCheck_Wire(const TopoDS_Wire &W);
		%feature("autodoc", "1");
		virtual		void InContext(const TopoDS_Shape &ContextShape);
		%feature("autodoc", "1");
		virtual		void Minimum();
		%feature("autodoc", "1");
		virtual		void Blind();
		%feature("autodoc", "1");
		BRepCheck_Status Closed(const Standard_Boolean Update=0);
		%feature("autodoc", "1");
		BRepCheck_Status Closed2d(const TopoDS_Face &F, const Standard_Boolean Update=0);
		%feature("autodoc", "1");
		BRepCheck_Status Orientation(const TopoDS_Face &F, const Standard_Boolean Update=0);
		%feature("autodoc", "1");
		BRepCheck_Status SelfIntersect(const TopoDS_Face &F, TopoDS_Edge & E1, TopoDS_Edge & E2, const Standard_Boolean Update=0);
		%feature("autodoc", "1");
		Standard_Boolean GeometricControls() const;
		%feature("autodoc", "1");
		void GeometricControls(const Standard_Boolean B);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepCheck_Wire();

};
%extend BRepCheck_Wire {
	Handle_BRepCheck_Wire GetHandle() {
	return *(Handle_BRepCheck_Wire*) &$self;
	}
};

%nodefaultctor BRepCheck_Vertex;
class BRepCheck_Vertex : public BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		BRepCheck_Vertex(const TopoDS_Vertex &V);
		%feature("autodoc", "1");
		virtual		void InContext(const TopoDS_Shape &ContextShape);
		%feature("autodoc", "1");
		virtual		void Minimum();
		%feature("autodoc", "1");
		virtual		void Blind();
		%feature("autodoc", "1");
		Standard_Real Tolerance();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepCheck_Vertex();

};
%extend BRepCheck_Vertex {
	Handle_BRepCheck_Vertex GetHandle() {
	return *(Handle_BRepCheck_Vertex*) &$self;
	}
};

%nodefaultctor BRepCheck_DataMapOfShapeResult;
class BRepCheck_DataMapOfShapeResult : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		BRepCheck_DataMapOfShapeResult(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		BRepCheck_DataMapOfShapeResult & Assign(const BRepCheck_DataMapOfShapeResult &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~BRepCheck_DataMapOfShapeResult();
		%feature("autodoc", "1");
		Standard_Boolean Bind(const TopoDS_Shape &K, const Handle_BRepCheck_Result &I);
		%feature("autodoc", "1");
		Standard_Boolean IsBound(const TopoDS_Shape &K) const;
		%feature("autodoc", "1");
		Standard_Boolean UnBind(const TopoDS_Shape &K);
		%feature("autodoc", "1");
		const Handle_BRepCheck_Result & Find(const TopoDS_Shape &K) const;
		%feature("autodoc", "1");
		const Handle_BRepCheck_Result & operator()(const TopoDS_Shape &K) const;
		%feature("autodoc", "1");
		Handle_BRepCheck_Result & ChangeFind(const TopoDS_Shape &K);
		%feature("autodoc", "1");
		Handle_BRepCheck_Result & operator()(const TopoDS_Shape &K);

};

%nodefaultctor BRepCheck_Edge;
class BRepCheck_Edge : public BRepCheck_Result {
	public:
		%feature("autodoc", "1");
		BRepCheck_Edge(const TopoDS_Edge &E);
		%feature("autodoc", "1");
		virtual		void InContext(const TopoDS_Shape &ContextShape);
		%feature("autodoc", "1");
		virtual		void Minimum();
		%feature("autodoc", "1");
		virtual		void Blind();
		%feature("autodoc", "1");
		Standard_Boolean GeometricControls() const;
		%feature("autodoc", "1");
		void GeometricControls(const Standard_Boolean B);
		%feature("autodoc", "1");
		Standard_Real Tolerance();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepCheck_Edge();

};
%extend BRepCheck_Edge {
	Handle_BRepCheck_Edge GetHandle() {
	return *(Handle_BRepCheck_Edge*) &$self;
	}
};

%nodefaultctor BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus;
class BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus(const TopoDS_Shape &K, const BRepCheck_ListOfStatus &I, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TopoDS_Shape & Key() const;
		%feature("autodoc", "1");
		BRepCheck_ListOfStatus & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus();

};
%extend BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus {
	Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus GetHandle() {
	return *(Handle_BRepCheck_DataMapNodeOfDataMapOfShapeListOfStatus*) &$self;
	}
};

%nodefaultctor BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus;
class BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus();
		%feature("autodoc", "1");
		BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus();
		%feature("autodoc", "1");
		BRepCheck_DataMapIteratorOfDataMapOfShapeListOfStatus(const BRepCheck_DataMapOfShapeListOfStatus &aMap);
		%feature("autodoc", "1");
		void Initialize(const BRepCheck_DataMapOfShapeListOfStatus &aMap);
		%feature("autodoc", "1");
		const TopoDS_Shape & Key() const;
		%feature("autodoc", "1");
		const BRepCheck_ListOfStatus & Value() const;

};

%nodefaultctor BRepCheck_ListOfStatus;
class BRepCheck_ListOfStatus {
	public:
		%feature("autodoc", "1");
		BRepCheck_ListOfStatus();
		%feature("autodoc", "1");
		void Assign(const BRepCheck_ListOfStatus &Other);
		%feature("autodoc", "1");
		Standard_Integer Extent() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~BRepCheck_ListOfStatus();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void Prepend(const BRepCheck_Status &I);
		%feature("autodoc", "1");
		void Prepend(const BRepCheck_Status &I, BRepCheck_ListIteratorOfListOfStatus & theIt);
		%feature("autodoc", "1");
		void Prepend(BRepCheck_ListOfStatus & Other);
		%feature("autodoc", "1");
		void Append(const BRepCheck_Status &I);
		%feature("autodoc", "1");
		void Append(const BRepCheck_Status &I, BRepCheck_ListIteratorOfListOfStatus & theIt);
		%feature("autodoc", "1");
		void Append(BRepCheck_ListOfStatus & Other);
		%feature("autodoc", "1");
		BRepCheck_Status & First() const;
		%feature("autodoc", "1");
		BRepCheck_Status & Last() const;
		%feature("autodoc", "1");
		void RemoveFirst();
		%feature("autodoc", "1");
		void Remove(BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("autodoc", "1");
		void InsertBefore(const BRepCheck_Status &I, BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("autodoc", "1");
		void InsertBefore(BRepCheck_ListOfStatus & Other, BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("autodoc", "1");
		void InsertAfter(const BRepCheck_Status &I, BRepCheck_ListIteratorOfListOfStatus & It);
		%feature("autodoc", "1");
		void InsertAfter(BRepCheck_ListOfStatus & Other, BRepCheck_ListIteratorOfListOfStatus & It);

};

%nodefaultctor BRepCheck_ListIteratorOfListOfStatus;
class BRepCheck_ListIteratorOfListOfStatus {
	public:
		%feature("autodoc", "1");
		~BRepCheck_ListIteratorOfListOfStatus();
		%feature("autodoc", "1");
		BRepCheck_ListIteratorOfListOfStatus();
		%feature("autodoc", "1");
		BRepCheck_ListIteratorOfListOfStatus(const BRepCheck_ListOfStatus &L);
		%feature("autodoc", "1");
		void Initialize(const BRepCheck_ListOfStatus &L);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();
		%feature("autodoc", "1");
		BRepCheck_Status & Value() const;

};

%nodefaultctor BRepCheck_Analyzer;
class BRepCheck_Analyzer {
	public:
		%feature("autodoc", "1");
		~BRepCheck_Analyzer();
		%feature("autodoc", "1");
		BRepCheck_Analyzer(const TopoDS_Shape &S, const Standard_Boolean B=1);
		%feature("autodoc", "1");
		void Init(const TopoDS_Shape &S, const Standard_Boolean GeomControls=1);
		%feature("autodoc", "1");
		Standard_Boolean IsValid(const TopoDS_Shape &S) const;
		%feature("autodoc", "1");
		Standard_Boolean IsValid() const;
		%feature("autodoc", "1");
		const Handle_BRepCheck_Result & Result(const TopoDS_Shape &S) const;

};