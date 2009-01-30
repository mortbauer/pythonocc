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
%module BRepExtrema

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


%include BRepExtrema_dependencies.i


%include BRepExtrema_headers.i


enum BRepExtrema_SupportType {
	BRepExtrema_IsVertex,
	BRepExtrema_IsOnEdge,
	BRepExtrema_IsInFace,
	};



%nodefaultctor Handle_BRepExtrema_SequenceNodeOfSeqOfSolution;
class Handle_BRepExtrema_SequenceNodeOfSeqOfSolution : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_BRepExtrema_SequenceNodeOfSeqOfSolution();
		%feature("autodoc", "1");
		Handle_BRepExtrema_SequenceNodeOfSeqOfSolution();
		%feature("autodoc", "1");
		Handle_BRepExtrema_SequenceNodeOfSeqOfSolution(const Handle_BRepExtrema_SequenceNodeOfSeqOfSolution &aHandle);
		%feature("autodoc", "1");
		Handle_BRepExtrema_SequenceNodeOfSeqOfSolution(const BRepExtrema_SequenceNodeOfSeqOfSolution *anItem);
		%feature("autodoc", "1");
		Handle_BRepExtrema_SequenceNodeOfSeqOfSolution const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepExtrema_SequenceNodeOfSeqOfSolution {
	BRepExtrema_SequenceNodeOfSeqOfSolution* GetObject() {
	return (BRepExtrema_SequenceNodeOfSeqOfSolution*)$self->Access();
	}
};

%nodefaultctor Handle_BRepExtrema_UnCompatibleShape;
class Handle_BRepExtrema_UnCompatibleShape : public Handle_Standard_DomainError {
	public:
		%feature("autodoc", "1");
		~Handle_BRepExtrema_UnCompatibleShape();
		%feature("autodoc", "1");
		Handle_BRepExtrema_UnCompatibleShape();
		%feature("autodoc", "1");
		Handle_BRepExtrema_UnCompatibleShape(const Handle_BRepExtrema_UnCompatibleShape &aHandle);
		%feature("autodoc", "1");
		Handle_BRepExtrema_UnCompatibleShape(const BRepExtrema_UnCompatibleShape *anItem);
		%feature("autodoc", "1");
		Handle_BRepExtrema_UnCompatibleShape const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_BRepExtrema_UnCompatibleShape {
	BRepExtrema_UnCompatibleShape* GetObject() {
	return (BRepExtrema_UnCompatibleShape*)$self->Access();
	}
};

%nodefaultctor BRepExtrema_SeqOfSolution;
class BRepExtrema_SeqOfSolution : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		BRepExtrema_SeqOfSolution();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~BRepExtrema_SeqOfSolution();
		%feature("autodoc", "1");
		const BRepExtrema_SeqOfSolution & Assign(const BRepExtrema_SeqOfSolution &Other);
		%feature("autodoc", "1");
		void Append(const BRepExtrema_SolutionElem &T);
		%feature("autodoc", "1");
		void Append(BRepExtrema_SeqOfSolution & S);
		%feature("autodoc", "1");
		void Prepend(const BRepExtrema_SolutionElem &T);
		%feature("autodoc", "1");
		void Prepend(BRepExtrema_SeqOfSolution & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const BRepExtrema_SolutionElem &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, BRepExtrema_SeqOfSolution & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const BRepExtrema_SolutionElem &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, BRepExtrema_SeqOfSolution & S);
		%feature("autodoc", "1");
		const BRepExtrema_SolutionElem & First() const;
		%feature("autodoc", "1");
		const BRepExtrema_SolutionElem & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, BRepExtrema_SeqOfSolution & S);
		%feature("autodoc", "1");
		const BRepExtrema_SolutionElem & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const BRepExtrema_SolutionElem & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const BRepExtrema_SolutionElem &I);
		%feature("autodoc", "1");
		BRepExtrema_SolutionElem & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		BRepExtrema_SolutionElem & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor BRepExtrema_Poly;
class BRepExtrema_Poly {
	public:
		%feature("autodoc", "1");
		~BRepExtrema_Poly();
		%feature("autodoc", "1");
		BRepExtrema_Poly();
		%feature("autodoc", "1");
		Standard_Boolean Distance(const TopoDS_Shape &S1, const TopoDS_Shape &S2, gp_Pnt & P1, gp_Pnt & P2, Standard_Real &OutValue);

};

%nodefaultctor BRepExtrema_ExtPF;
class BRepExtrema_ExtPF {
	public:
		%feature("autodoc", "1");
		~BRepExtrema_ExtPF();
		%feature("autodoc", "1");
		BRepExtrema_ExtPF();
		%feature("autodoc", "1");
		BRepExtrema_ExtPF(const TopoDS_Vertex &V, const TopoDS_Face &E);
		%feature("autodoc", "1");
		void Initialize(const TopoDS_Face &E);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Vertex &V, const TopoDS_Face &E);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbExt() const;
		%feature("autodoc", "1");
		Standard_Real Value(const Standard_Integer N) const;
		%feature("autodoc", "1");
		void Parameter(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		gp_Pnt Point(const Standard_Integer N) const;

};

%nodefaultctor BRepExtrema_DistanceSS;
class BRepExtrema_DistanceSS {
	public:
		%feature("autodoc", "1");
		~BRepExtrema_DistanceSS();
		%feature("autodoc", "1");
		BRepExtrema_DistanceSS(const TopoDS_Shape &S1, const TopoDS_Shape &S2, const Bnd_Box &B1, const Bnd_Box &B2, const Standard_Real DstRef);
		%feature("autodoc", "1");
		BRepExtrema_DistanceSS(const TopoDS_Shape &S1, const TopoDS_Shape &S2, const Bnd_Box &B1, const Bnd_Box &B2, const Standard_Real DstRef, const Standard_Real aDeflection);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Real DistValue() const;
		%feature("autodoc", "1");
		const BRepExtrema_SeqOfSolution & Seq1Value() const;
		%feature("autodoc", "1");
		const BRepExtrema_SeqOfSolution & Seq2Value() const;

};

%nodefaultctor BRepExtrema_ExtCC;
class BRepExtrema_ExtCC {
	public:
		%feature("autodoc", "1");
		~BRepExtrema_ExtCC();
		%feature("autodoc", "1");
		BRepExtrema_ExtCC();
		%feature("autodoc", "1");
		BRepExtrema_ExtCC(const TopoDS_Edge &E1, const TopoDS_Edge &E2);
		%feature("autodoc", "1");
		void Initialize(const TopoDS_Edge &E2);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Edge &E1);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbExt() const;
		%feature("autodoc", "1");
		Standard_Boolean IsParallel() const;
		%feature("autodoc", "1");
		Standard_Real Value(const Standard_Integer N) const;
		%feature("autodoc", "1");
		Standard_Real ParameterOnE1(const Standard_Integer N) const;
		%feature("autodoc", "1");
		gp_Pnt PointOnE1(const Standard_Integer N) const;
		%feature("autodoc", "1");
		Standard_Real ParameterOnE2(const Standard_Integer N) const;
		%feature("autodoc", "1");
		gp_Pnt PointOnE2(const Standard_Integer N) const;
		%feature("autodoc", "1");
		void TrimmedDistances(Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & P11, gp_Pnt & P12, gp_Pnt & P21, gp_Pnt & P22) const;

};

%nodefaultctor BRepExtrema_SequenceNodeOfSeqOfSolution;
class BRepExtrema_SequenceNodeOfSeqOfSolution : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		BRepExtrema_SequenceNodeOfSeqOfSolution(const BRepExtrema_SolutionElem &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		BRepExtrema_SolutionElem & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepExtrema_SequenceNodeOfSeqOfSolution();

};
%extend BRepExtrema_SequenceNodeOfSeqOfSolution {
	Handle_BRepExtrema_SequenceNodeOfSeqOfSolution GetHandle() {
	return *(Handle_BRepExtrema_SequenceNodeOfSeqOfSolution*) &$self;
	}
};

%nodefaultctor BRepExtrema_ExtCF;
class BRepExtrema_ExtCF {
	public:
		%feature("autodoc", "1");
		~BRepExtrema_ExtCF();
		%feature("autodoc", "1");
		BRepExtrema_ExtCF();
		%feature("autodoc", "1");
		BRepExtrema_ExtCF(const TopoDS_Edge &V, const TopoDS_Face &E);
		%feature("autodoc", "1");
		void Initialize(const TopoDS_Face &E);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Edge &V, const TopoDS_Face &E);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbExt() const;
		%feature("autodoc", "1");
		Standard_Real Value(const Standard_Integer N) const;
		%feature("autodoc", "1");
		Standard_Boolean IsParallel() const;
		%feature("autodoc", "1");
		Standard_Real ParameterOnEdge(const Standard_Integer N) const;
		%feature("autodoc", "1");
		void ParameterOnFace(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		gp_Pnt PointOnEdge(const Standard_Integer N) const;
		%feature("autodoc", "1");
		gp_Pnt PointOnFace(const Standard_Integer N) const;

};

%nodefaultctor BRepExtrema_ExtFF;
class BRepExtrema_ExtFF {
	public:
		%feature("autodoc", "1");
		~BRepExtrema_ExtFF();
		%feature("autodoc", "1");
		BRepExtrema_ExtFF();
		%feature("autodoc", "1");
		BRepExtrema_ExtFF(const TopoDS_Face &F1, const TopoDS_Face &F2);
		%feature("autodoc", "1");
		void Initialize(const TopoDS_Face &F2);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Face &F1, const TopoDS_Face &F2);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Boolean IsParallel() const;
		%feature("autodoc", "1");
		Standard_Integer NbExt() const;
		%feature("autodoc", "1");
		Standard_Real Value(const Standard_Integer N) const;
		%feature("autodoc", "1");
		void ParameterOnFace1(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		void ParameterOnFace2(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		gp_Pnt PointOnFace1(const Standard_Integer N) const;
		%feature("autodoc", "1");
		gp_Pnt PointOnFace2(const Standard_Integer N) const;

};

%nodefaultctor BRepExtrema_ExtPC;
class BRepExtrema_ExtPC {
	public:
		%feature("autodoc", "1");
		~BRepExtrema_ExtPC();
		%feature("autodoc", "1");
		BRepExtrema_ExtPC();
		%feature("autodoc", "1");
		BRepExtrema_ExtPC(const TopoDS_Vertex &V, const TopoDS_Edge &E);
		%feature("autodoc", "1");
		void Initialize(const TopoDS_Edge &E);
		%feature("autodoc", "1");
		void Perform(const TopoDS_Vertex &V);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbExt() const;
		%feature("autodoc", "1");
		Standard_Boolean IsMin(const Standard_Integer N) const;
		%feature("autodoc", "1");
		Standard_Real Value(const Standard_Integer N) const;
		%feature("autodoc", "1");
		Standard_Real Parameter(const Standard_Integer N) const;
		%feature("autodoc", "1");
		gp_Pnt Point(const Standard_Integer N) const;
		%feature("autodoc", "1");
		void TrimmedDistances(Standard_Real &OutValue, Standard_Real &OutValue, gp_Pnt & pnt1, gp_Pnt & pnt2) const;

};

%nodefaultctor BRepExtrema_UnCompatibleShape;
class BRepExtrema_UnCompatibleShape : public Standard_DomainError {
	public:
		%feature("autodoc", "1");
		BRepExtrema_UnCompatibleShape();
		%feature("autodoc", "1");
		BRepExtrema_UnCompatibleShape(const char * AString);
		%feature("autodoc", "1");
		void Raise(const char * aMessage="");
		%feature("autodoc", "1");
		void Raise(Standard_SStream & aReason);
		%feature("autodoc", "1");
		Handle_BRepExtrema_UnCompatibleShape NewInstance(const char * aMessage);
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~BRepExtrema_UnCompatibleShape();

};
%extend BRepExtrema_UnCompatibleShape {
	Handle_BRepExtrema_UnCompatibleShape GetHandle() {
	return *(Handle_BRepExtrema_UnCompatibleShape*) &$self;
	}
};

%nodefaultctor BRepExtrema_DistShapeShape;
class BRepExtrema_DistShapeShape {
	public:
		%feature("autodoc", "1");
		~BRepExtrema_DistShapeShape();
		%feature("autodoc", "1");
		BRepExtrema_DistShapeShape();
		%feature("autodoc", "1");
		BRepExtrema_DistShapeShape(const TopoDS_Shape &Shape1, const TopoDS_Shape &Shape2);
		%feature("autodoc", "1");
		BRepExtrema_DistShapeShape(const TopoDS_Shape &Shape1, const TopoDS_Shape &Shape2, const Standard_Real theDeflection);
		%feature("autodoc", "1");
		void SetDeflection(const Standard_Real theDeflection);
		%feature("autodoc", "1");
		void LoadS1(const TopoDS_Shape &Shape1);
		%feature("autodoc", "1");
		void LoadS2(const TopoDS_Shape &Shape1);
		%feature("autodoc", "1");
		Standard_Boolean Perform();
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbSolution() const;
		%feature("autodoc", "1");
		Standard_Real Value() const;
		%feature("autodoc", "1");
		Standard_Boolean InnerSolution() const;
		%feature("autodoc", "1");
		gp_Pnt PointOnShape1(const Standard_Integer N) const;
		%feature("autodoc", "1");
		gp_Pnt PointOnShape2(const Standard_Integer N) const;
		%feature("autodoc", "1");
		BRepExtrema_SupportType SupportTypeShape1(const Standard_Integer N) const;
		%feature("autodoc", "1");
		BRepExtrema_SupportType SupportTypeShape2(const Standard_Integer N) const;
		%feature("autodoc", "1");
		TopoDS_Shape SupportOnShape1(const Standard_Integer N) const;
		%feature("autodoc", "1");
		TopoDS_Shape SupportOnShape2(const Standard_Integer N) const;
		%feature("autodoc", "1");
		void ParOnEdgeS1(const Standard_Integer N, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		void ParOnEdgeS2(const Standard_Integer N, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		void ParOnFaceS1(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		void ParOnFaceS2(const Standard_Integer N, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		void Dump(Standard_OStream & o) const;

};

%nodefaultctor BRepExtrema_SolutionElem;
class BRepExtrema_SolutionElem {
	public:
		%feature("autodoc", "1");
		~BRepExtrema_SolutionElem();
		%feature("autodoc", "1");
		BRepExtrema_SolutionElem();
		%feature("autodoc", "1");
		BRepExtrema_SolutionElem(const Standard_Real d, const gp_Pnt &Pt, const BRepExtrema_SupportType SolType, const TopoDS_Vertex &vertex);
		%feature("autodoc", "1");
		BRepExtrema_SolutionElem(const Standard_Real d, const gp_Pnt &Pt, const BRepExtrema_SupportType SolType, const TopoDS_Edge &edge, const Standard_Real t);
		%feature("autodoc", "1");
		BRepExtrema_SolutionElem(const Standard_Real d, const gp_Pnt &Pt, const BRepExtrema_SupportType SolType, const TopoDS_Face &face, const Standard_Real u, const Standard_Real v);
		%feature("autodoc", "1");
		Standard_Real Dist() const;
		%feature("autodoc", "1");
		gp_Pnt Point() const;
		%feature("autodoc", "1");
		BRepExtrema_SupportType SupportKind() const;
		%feature("autodoc", "1");
		TopoDS_Vertex Vertex() const;
		%feature("autodoc", "1");
		TopoDS_Edge Edge() const;
		%feature("autodoc", "1");
		TopoDS_Face Face() const;
		%feature("autodoc", "1");
		void EdgeParameter(Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		void FaceParameter(Standard_Real &OutValue, Standard_Real &OutValue) const;

};