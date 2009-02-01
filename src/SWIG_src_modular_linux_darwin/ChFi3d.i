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
%module ChFi3d

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


%include ChFi3d_dependencies.i


%include ChFi3d_headers.i


enum ChFi3d_FilletShape {
	ChFi3d_Rational,
	ChFi3d_QuasiAngular,
	ChFi3d_Polynomial,
	};



%nodefaultctor ChFi3d;
class ChFi3d {
	public:
		%feature("autodoc", "1");
		~ChFi3d();
		%feature("autodoc", "1");
		ChFi3d();
		%feature("autodoc", "1");
		Standard_Integer ConcaveSide(const BRepAdaptor_Surface &S1, const BRepAdaptor_Surface &S2, const TopoDS_Edge &E, TopAbs_Orientation & Or1, TopAbs_Orientation & Or2);
		%feature("autodoc", "1");
		Standard_Integer NextSide(TopAbs_Orientation & Or1, TopAbs_Orientation & Or2, const TopAbs_Orientation OrSave1, const TopAbs_Orientation OrSave2, const Standard_Integer ChoixSauv);
		%feature("autodoc", "1");
		void NextSide(TopAbs_Orientation & Or, const TopAbs_Orientation OrSave, const TopAbs_Orientation OrFace);
		%feature("autodoc", "1");
		Standard_Boolean SameSide(const TopAbs_Orientation Or, const TopAbs_Orientation OrSave1, const TopAbs_Orientation OrSave2, const TopAbs_Orientation OrFace1, const TopAbs_Orientation OrFace2);

};

%nodefaultctor ChFi3d_SearchSing;
class ChFi3d_SearchSing : public math_FunctionWithDerivative {
	public:
		%feature("autodoc", "1");
		ChFi3d_SearchSing(const Handle_Geom_Curve &C1, const Handle_Geom_Curve &C2);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Value(const Standard_Real X, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Derivative(const Standard_Real X, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		Standard_Boolean Values(const Standard_Real X, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		virtual		~ChFi3d_SearchSing();

};

%nodefaultctor ChFi3d_Builder;
class ChFi3d_Builder {
	public:
		%feature("autodoc", "1");
		virtual		void Delete();
		%feature("autodoc", "1");
		void SetParams(const Standard_Real Tang, const Standard_Real Tesp, const Standard_Real T2d, const Standard_Real TApp3d, const Standard_Real TolApp2d, const Standard_Real Fleche);
		%feature("autodoc", "1");
		void SetContinuity(const GeomAbs_Shape InternalContinuity, const Standard_Real AngularTolerance);
		%feature("autodoc", "1");
		void Remove(const TopoDS_Edge &E);
		%feature("autodoc", "1");
		Standard_Integer Contains(const TopoDS_Edge &E) const;
		%feature("autodoc", "1");
		Standard_Integer Contains(const TopoDS_Edge &E, Standard_Integer & IndexInSpine) const;
		%feature("autodoc", "1");
		Standard_Integer NbElements() const;
		%feature("autodoc", "1");
		Handle_ChFiDS_Spine Value(const Standard_Integer I) const;
		%feature("autodoc", "1");
		Standard_Real Length(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		TopoDS_Vertex FirstVertex(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		TopoDS_Vertex LastVertex(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		Standard_Real Abscissa(const Standard_Integer IC, const TopoDS_Vertex &V) const;
		%feature("autodoc", "1");
		Standard_Real RelativeAbscissa(const Standard_Integer IC, const TopoDS_Vertex &V) const;
		%feature("autodoc", "1");
		Standard_Boolean ClosedAndTangent(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		Standard_Boolean Closed(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		void Compute();
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		TopoDS_Shape Shape() const;
		%feature("autodoc", "1");
		const TopTools_ListOfShape & Generated(const TopoDS_Shape &EouV);
		%feature("autodoc", "1");
		Standard_Integer NbFaultyContours() const;
		%feature("autodoc", "1");
		Standard_Integer FaultyContour(const Standard_Integer I) const;
		%feature("autodoc", "1");
		Standard_Integer NbComputedSurfaces(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		Handle_Geom_Surface ComputedSurface(const Standard_Integer IC, const Standard_Integer IS) const;
		%feature("autodoc", "1");
		Standard_Integer NbFaultyVertices() const;
		%feature("autodoc", "1");
		TopoDS_Vertex FaultyVertex(const Standard_Integer IV) const;
		%feature("autodoc", "1");
		Standard_Boolean HasResult() const;
		%feature("autodoc", "1");
		TopoDS_Shape BadShape() const;
		%feature("autodoc", "1");
		ChFiDS_ErrorStatus StripeStatus(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		void Reset();
		%feature("autodoc", "1");
		Handle_TopOpeBRepBuild_HBuilder Builder() const;
		%feature("autodoc", "1");
		Standard_Boolean SplitKPart(const Handle_ChFiDS_SurfData &Data, ChFiDS_SequenceOfSurfData & SetData, const Handle_ChFiDS_Spine &Spine, const Standard_Integer Iedge, const Handle_Adaptor3d_HSurface &S1, const Handle_Adaptor3d_TopolTool &I1, const Handle_Adaptor3d_HSurface &S2, const Handle_Adaptor3d_TopolTool &I2, Standard_Boolean & Intf, Standard_Boolean & Intl);
		%feature("autodoc", "1");
		Standard_Integer PerformTwoCornerbyInter(const Standard_Integer Index);

};

%nodefaultctor ChFi3d_ChBuilder;
class ChFi3d_ChBuilder : public ChFi3d_Builder {
	public:
		%feature("autodoc", "1");
		ChFi3d_ChBuilder(const TopoDS_Shape &S, const Standard_Real Ta=1.0000000000000000208166817117216851329430937767e-2);
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E);
		%feature("autodoc", "1");
		void Add(const Standard_Real Dis, const TopoDS_Edge &E, const TopoDS_Face &F);
		%feature("autodoc", "1");
		void SetDist(const Standard_Real Dis, const Standard_Integer IC, const TopoDS_Face &F);
		%feature("autodoc", "1");
		void GetDist(const Standard_Integer IC, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		void Add(const Standard_Real Dis1, const Standard_Real Dis2, const TopoDS_Edge &E, const TopoDS_Face &F);
		%feature("autodoc", "1");
		void SetDists(const Standard_Real Dis1, const Standard_Real Dis2, const Standard_Integer IC, const TopoDS_Face &F);
		%feature("autodoc", "1");
		void Dists(const Standard_Integer IC, Standard_Real &OutValue, Standard_Real &OutValue) const;
		%feature("autodoc", "1");
		void AddDA(const Standard_Real Dis, const Standard_Real Angle, const TopoDS_Edge &E, const TopoDS_Face &F);
		%feature("autodoc", "1");
		void SetDistAngle(const Standard_Real Dis, const Standard_Real Angle, const Standard_Integer IC, const TopoDS_Face &F);
		%feature("autodoc", "1");
		void GetDistAngle(const Standard_Integer IC, Standard_Real &OutValue, Standard_Real &OutValue, Standard_Boolean & DisOnFace1) const;
		%feature("autodoc", "1");
		ChFiDS_ChamfMethod IsChamfer(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		void ResetContour(const Standard_Integer IC);
		%feature("autodoc", "1");
		void Simulate(const Standard_Integer IC);
		%feature("autodoc", "1");
		Standard_Integer NbSurf(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		Handle_ChFiDS_SecHArray1 Sect(const Standard_Integer IC, const Standard_Integer IS) const;
		%feature("autodoc", "1");
		virtual		void SimulSurf(Handle_ChFiDS_SurfData & Data, const Handle_ChFiDS_HElSpine &Guide, const Handle_ChFiDS_Spine &Spine, const Standard_Integer Choix, const Handle_BRepAdaptor_HSurface &S1, const Handle_Adaptor3d_TopolTool &I1, const Handle_BRepAdaptor_HCurve2d &PC1, const Handle_BRepAdaptor_HSurface &Sref1, const Handle_BRepAdaptor_HCurve2d &PCref1, Standard_Boolean & Decroch1, const Handle_BRepAdaptor_HSurface &S2, const Handle_Adaptor3d_TopolTool &I2, const TopAbs_Orientation Or2, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP, const Standard_Boolean RecS, const Standard_Boolean RecRst, const math_Vector &Soldep);
		%feature("autodoc", "1");
		virtual		void SimulSurf(Handle_ChFiDS_SurfData & Data, const Handle_ChFiDS_HElSpine &Guide, const Handle_ChFiDS_Spine &Spine, const Standard_Integer Choix, const Handle_BRepAdaptor_HSurface &S1, const Handle_Adaptor3d_TopolTool &I1, const TopAbs_Orientation Or1, const Handle_BRepAdaptor_HSurface &S2, const Handle_Adaptor3d_TopolTool &I2, const Handle_BRepAdaptor_HCurve2d &PC2, const Handle_BRepAdaptor_HSurface &Sref2, const Handle_BRepAdaptor_HCurve2d &PCref2, Standard_Boolean & Decroch2, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP, const Standard_Boolean RecS, const Standard_Boolean RecRst, const math_Vector &Soldep);
		%feature("autodoc", "1");
		virtual		void SimulSurf(Handle_ChFiDS_SurfData & Data, const Handle_ChFiDS_HElSpine &Guide, const Handle_ChFiDS_Spine &Spine, const Standard_Integer Choix, const Handle_BRepAdaptor_HSurface &S1, const Handle_Adaptor3d_TopolTool &I1, const Handle_BRepAdaptor_HCurve2d &PC1, const Handle_BRepAdaptor_HSurface &Sref1, const Handle_BRepAdaptor_HCurve2d &PCref1, Standard_Boolean & Decroch1, const TopAbs_Orientation Or1, const Handle_BRepAdaptor_HSurface &S2, const Handle_Adaptor3d_TopolTool &I2, const Handle_BRepAdaptor_HCurve2d &PC2, const Handle_BRepAdaptor_HSurface &Sref2, const Handle_BRepAdaptor_HCurve2d &PCref2, Standard_Boolean & Decroch2, const TopAbs_Orientation Or2, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP1, const Standard_Boolean RecRst1, const Standard_Boolean RecP2, const Standard_Boolean RecRst2, const math_Vector &Soldep);
		%feature("autodoc", "1");
		virtual		Standard_Boolean PerformSurf(ChFiDS_SequenceOfSurfData & Data, const Handle_ChFiDS_HElSpine &Guide, const Handle_ChFiDS_Spine &Spine, const Standard_Integer Choix, const Handle_BRepAdaptor_HSurface &S1, const Handle_Adaptor3d_TopolTool &I1, const Handle_BRepAdaptor_HSurface &S2, const Handle_Adaptor3d_TopolTool &I2, const Standard_Real MaxStep, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecOnS1, const Standard_Boolean RecOnS2, const math_Vector &Soldep, Standard_Boolean & Intf, Standard_Boolean & Intl);
		%feature("autodoc", "1");
		virtual		void PerformSurf(ChFiDS_SequenceOfSurfData & Data, const Handle_ChFiDS_HElSpine &Guide, const Handle_ChFiDS_Spine &Spine, const Standard_Integer Choix, const Handle_BRepAdaptor_HSurface &S1, const Handle_Adaptor3d_TopolTool &I1, const Handle_BRepAdaptor_HCurve2d &PC1, const Handle_BRepAdaptor_HSurface &Sref1, const Handle_BRepAdaptor_HCurve2d &PCref1, Standard_Boolean & Decroch1, const Handle_BRepAdaptor_HSurface &S2, const Handle_Adaptor3d_TopolTool &I2, const TopAbs_Orientation Or2, const Standard_Real MaxStep, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP, const Standard_Boolean RecS, const Standard_Boolean RecRst, const math_Vector &Soldep);
		%feature("autodoc", "1");
		virtual		void PerformSurf(ChFiDS_SequenceOfSurfData & Data, const Handle_ChFiDS_HElSpine &Guide, const Handle_ChFiDS_Spine &Spine, const Standard_Integer Choix, const Handle_BRepAdaptor_HSurface &S1, const Handle_Adaptor3d_TopolTool &I1, const TopAbs_Orientation Or1, const Handle_BRepAdaptor_HSurface &S2, const Handle_Adaptor3d_TopolTool &I2, const Handle_BRepAdaptor_HCurve2d &PC2, const Handle_BRepAdaptor_HSurface &Sref2, const Handle_BRepAdaptor_HCurve2d &PCref2, Standard_Boolean & Decroch2, const Standard_Real MaxStep, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP, const Standard_Boolean RecS, const Standard_Boolean RecRst, const math_Vector &Soldep);
		%feature("autodoc", "1");
		virtual		void PerformSurf(ChFiDS_SequenceOfSurfData & Data, const Handle_ChFiDS_HElSpine &Guide, const Handle_ChFiDS_Spine &Spine, const Standard_Integer Choix, const Handle_BRepAdaptor_HSurface &S1, const Handle_Adaptor3d_TopolTool &I1, const Handle_BRepAdaptor_HCurve2d &PC1, const Handle_BRepAdaptor_HSurface &Sref1, const Handle_BRepAdaptor_HCurve2d &PCref1, Standard_Boolean & Decroch1, const TopAbs_Orientation Or1, const Handle_BRepAdaptor_HSurface &S2, const Handle_Adaptor3d_TopolTool &I2, const Handle_BRepAdaptor_HCurve2d &PC2, const Handle_BRepAdaptor_HSurface &Sref2, const Handle_BRepAdaptor_HCurve2d &PCref2, Standard_Boolean & Decroch2, const TopAbs_Orientation Or2, const Standard_Real MaxStep, const Standard_Real Fleche, const Standard_Real TolGuide, Standard_Real &OutValue, Standard_Real &OutValue, const Standard_Boolean Inside, const Standard_Boolean Appro, const Standard_Boolean Forward, const Standard_Boolean RecP1, const Standard_Boolean RecRst1, const Standard_Boolean RecP2, const Standard_Boolean RecRst2, const math_Vector &Soldep);
		%feature("autodoc", "1");
		Standard_Integer FindChoiceDistAngle(const Standard_Integer Choice, const Standard_Boolean DisOnF1) const;
		%feature("autodoc", "1");
		virtual		~ChFi3d_ChBuilder();

};

%nodefaultctor ChFi3d_FilBuilder;
class ChFi3d_FilBuilder : public ChFi3d_Builder {
	public:
		%feature("autodoc", "1");
		ChFi3d_FilBuilder(const TopoDS_Shape &S, const ChFi3d_FilletShape FShape=ChFi3d_Rational, const Standard_Real Ta=1.0000000000000000208166817117216851329430937767e-2);
		%feature("autodoc", "1");
		void SetFilletShape(const ChFi3d_FilletShape FShape);
		%feature("autodoc", "1");
		ChFi3d_FilletShape GetFilletShape() const;
		%feature("autodoc", "1");
		void Add(const TopoDS_Edge &E);
		%feature("autodoc", "1");
		void Add(const Standard_Real Radius, const TopoDS_Edge &E);
		%feature("autodoc", "1");
		void SetRadius(const Handle_Law_Function &C, const Standard_Integer IC, const Standard_Integer IinC);
		%feature("autodoc", "1");
		Standard_Boolean IsConstant(const Standard_Integer IC);
		%feature("autodoc", "1");
		Standard_Real Radius(const Standard_Integer IC);
		%feature("autodoc", "1");
		void ResetContour(const Standard_Integer IC);
		%feature("autodoc", "1");
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const TopoDS_Edge &E);
		%feature("autodoc", "1");
		void UnSet(const Standard_Integer IC, const TopoDS_Edge &E);
		%feature("autodoc", "1");
		void SetRadius(const Standard_Real Radius, const Standard_Integer IC, const TopoDS_Vertex &V);
		%feature("autodoc", "1");
		void UnSet(const Standard_Integer IC, const TopoDS_Vertex &V);
		%feature("autodoc", "1");
		void SetRadius(const gp_XY &UandR, const Standard_Integer IC, const Standard_Integer IinC);
		%feature("autodoc", "1");
		Standard_Boolean IsConstant(const Standard_Integer IC, const TopoDS_Edge &E);
		%feature("autodoc", "1");
		Standard_Real Radius(const Standard_Integer IC, const TopoDS_Edge &E);
		%feature("autodoc", "1");
		Standard_Boolean GetBounds(const Standard_Integer IC, const TopoDS_Edge &E, Standard_Real &OutValue, Standard_Real &OutValue);
		%feature("autodoc", "1");
		Handle_Law_Function GetLaw(const Standard_Integer IC, const TopoDS_Edge &E);
		%feature("autodoc", "1");
		void SetLaw(const Standard_Integer IC, const TopoDS_Edge &E, const Handle_Law_Function &L);
		%feature("autodoc", "1");
		void Simulate(const Standard_Integer IC);
		%feature("autodoc", "1");
		Standard_Integer NbSurf(const Standard_Integer IC) const;
		%feature("autodoc", "1");
		Handle_ChFiDS_SecHArray1 Sect(const Standard_Integer IC, const Standard_Integer IS) const;
		%feature("autodoc", "1");
		virtual		~ChFi3d_FilBuilder();

};