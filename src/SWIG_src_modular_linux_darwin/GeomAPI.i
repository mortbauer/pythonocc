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
%module GeomAPI

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


%include GeomAPI_dependencies.i


%include GeomAPI_headers.i




%nodefaultctor GeomAPI_ExtremaCurveSurface;
class GeomAPI_ExtremaCurveSurface {
	public:
		%feature("autodoc", "1");
		~GeomAPI_ExtremaCurveSurface();
		%feature("autodoc", "1");
		GeomAPI_ExtremaCurveSurface();
		%feature("autodoc", "1");
		GeomAPI_ExtremaCurveSurface(const Handle_Geom_Curve &Curve, const Handle_Geom_Surface &Surface);
		%feature("autodoc", "1");
		GeomAPI_ExtremaCurveSurface(const Handle_Geom_Curve &Curve, const Handle_Geom_Surface &Surface, const Quantity_Parameter Wmin, const Quantity_Parameter Wmax, const Quantity_Parameter Umin, const Quantity_Parameter Umax, const Quantity_Parameter Vmin, const Quantity_Parameter Vmax);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Curve &Curve, const Handle_Geom_Surface &Surface);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Curve &Curve, const Handle_Geom_Surface &Surface, const Quantity_Parameter Wmin, const Quantity_Parameter Wmax, const Quantity_Parameter Umin, const Quantity_Parameter Umax, const Quantity_Parameter Vmin, const Quantity_Parameter Vmax);
		%feature("autodoc", "1");
		Standard_Integer NbExtrema() const;
		%feature("autodoc", "1");
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2) const;
		%feature("autodoc", "1");
		void Parameters(const Standard_Integer Index, Quantity_Parameter & W, Quantity_Parameter & U, Quantity_Parameter & V) const;
		%feature("autodoc", "1");
		Quantity_Length Distance(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void NearestPoints(gp_Pnt & PC, gp_Pnt & PS) const;
		%feature("autodoc", "1");
		void LowerDistanceParameters(Quantity_Parameter & W, Quantity_Parameter & U, Quantity_Parameter & V) const;
		%feature("autodoc", "1");
		Quantity_Length LowerDistance() const;
		%feature("autodoc", "1");
		const Extrema_ExtCS & Extrema() const;

};

%nodefaultctor GeomAPI_ProjectPointOnSurf;
class GeomAPI_ProjectPointOnSurf {
	public:
		%feature("autodoc", "1");
		~GeomAPI_ProjectPointOnSurf();
		%feature("autodoc", "1");
		GeomAPI_ProjectPointOnSurf();
		%feature("autodoc", "1");
		GeomAPI_ProjectPointOnSurf(const gp_Pnt &P, const Handle_Geom_Surface &Surface);
		%feature("autodoc", "1");
		GeomAPI_ProjectPointOnSurf(const gp_Pnt &P, const Handle_Geom_Surface &Surface, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GeomAPI_ProjectPointOnSurf(const gp_Pnt &P, const Handle_Geom_Surface &Surface, const Quantity_Parameter Umin, const Quantity_Parameter Usup, const Quantity_Parameter Vmin, const Quantity_Parameter Vsup, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GeomAPI_ProjectPointOnSurf(const gp_Pnt &P, const Handle_Geom_Surface &Surface, const Quantity_Parameter Umin, const Quantity_Parameter Usup, const Quantity_Parameter Vmin, const Quantity_Parameter Vsup);
		%feature("autodoc", "1");
		void Init(const gp_Pnt &P, const Handle_Geom_Surface &Surface, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		void Init(const gp_Pnt &P, const Handle_Geom_Surface &Surface);
		%feature("autodoc", "1");
		void Init(const gp_Pnt &P, const Handle_Geom_Surface &Surface, const Quantity_Parameter Umin, const Quantity_Parameter Usup, const Quantity_Parameter Vmin, const Quantity_Parameter Vsup, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		void Init(const gp_Pnt &P, const Handle_Geom_Surface &Surface, const Quantity_Parameter Umin, const Quantity_Parameter Usup, const Quantity_Parameter Vmin, const Quantity_Parameter Vsup);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Surface &Surface, const Quantity_Parameter Umin, const Quantity_Parameter Usup, const Quantity_Parameter Vmin, const Quantity_Parameter Vsup, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Surface &Surface, const Quantity_Parameter Umin, const Quantity_Parameter Usup, const Quantity_Parameter Vmin, const Quantity_Parameter Vsup);
		%feature("autodoc", "1");
		void Perform(const gp_Pnt &P);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbPoints() const;
		%feature("autodoc", "1");
		gp_Pnt Point(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Parameters(const Standard_Integer Index, Quantity_Parameter & U, Quantity_Parameter & V) const;
		%feature("autodoc", "1");
		Quantity_Length Distance(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		gp_Pnt NearestPoint() const;
		%feature("autodoc", "1");
		void LowerDistanceParameters(Quantity_Parameter & U, Quantity_Parameter & V) const;
		%feature("autodoc", "1");
		Quantity_Length LowerDistance() const;
		%feature("autodoc", "1");
		const Extrema_ExtPS & Extrema() const;

};

%nodefaultctor GeomAPI;
class GeomAPI {
	public:
		%feature("autodoc", "1");
		~GeomAPI();
		%feature("autodoc", "1");
		GeomAPI();
		%feature("autodoc", "1");
		Handle_Geom2d_Curve To2d(const Handle_Geom_Curve &C, const gp_Pln &P);
		%feature("autodoc", "1");
		Handle_Geom_Curve To3d(const Handle_Geom2d_Curve &C, const gp_Pln &P);

};

%nodefaultctor GeomAPI_Interpolate;
class GeomAPI_Interpolate {
	public:
		%feature("autodoc", "1");
		~GeomAPI_Interpolate();
		%feature("autodoc", "1");
		GeomAPI_Interpolate(const Handle_TColgp_HArray1OfPnt &Points, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		GeomAPI_Interpolate(const Handle_TColgp_HArray1OfPnt &Points, const Handle_TColStd_HArray1OfReal &Parameters, const Standard_Boolean PeriodicFlag, const Standard_Real Tolerance);
		%feature("autodoc", "1");
		void Load(const gp_Vec &InitialTangent, const gp_Vec &FinalTangent, const Standard_Boolean Scale=1);
		%feature("autodoc", "1");
		void Load(const TColgp_Array1OfVec &Tangents, const Handle_TColStd_HArray1OfBoolean &TangentFlags, const Standard_Boolean Scale=1);
		%feature("autodoc", "1");
		void Perform();
		%feature("autodoc", "1");
		const Handle_Geom_BSplineCurve & Curve() const;
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;

};

%nodefaultctor GeomAPI_PointsToBSpline;
class GeomAPI_PointsToBSpline {
	public:
		%feature("autodoc", "1");
		~GeomAPI_PointsToBSpline();
		%feature("autodoc", "1");
		GeomAPI_PointsToBSpline();
		%feature("autodoc", "1");
		GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt &Points, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol3D=1.0000000000000000208166817117216851329430937767e-3);
		%feature("autodoc", "1");
		GeomAPI_PointsToBSpline(const TColgp_Array1OfPnt &Points, const TColStd_Array1OfReal &Parameters, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol3D=1.0000000000000000208166817117216851329430937767e-3);
		%feature("autodoc", "1");
		void Init(const TColgp_Array1OfPnt &Points, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol3D=1.0000000000000000208166817117216851329430937767e-3);
		%feature("autodoc", "1");
		void Init(const TColgp_Array1OfPnt &Points, const TColStd_Array1OfReal &Parameters, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol3D=1.0000000000000000208166817117216851329430937767e-3);
		%feature("autodoc", "1");
		const Handle_Geom_BSplineCurve & Curve() const;

};

%nodefaultctor GeomAPI_IntCS;
class GeomAPI_IntCS {
	public:
		%feature("autodoc", "1");
		~GeomAPI_IntCS();
		%feature("autodoc", "1");
		GeomAPI_IntCS();
		%feature("autodoc", "1");
		GeomAPI_IntCS(const Handle_Geom_Curve &C, const Handle_Geom_Surface &S);
		%feature("autodoc", "1");
		void Perform(const Handle_Geom_Curve &C, const Handle_Geom_Surface &S);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbPoints() const;
		%feature("autodoc", "1");
		const gp_Pnt & Point(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Parameters(const Standard_Integer Index, Quantity_Parameter & U, Quantity_Parameter & V, Quantity_Parameter & W) const;
		%feature("autodoc", "1");
		Standard_Integer NbSegments() const;
		%feature("autodoc", "1");
		Handle_Geom_Curve Segment(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Parameters(const Standard_Integer Index, Quantity_Parameter & U1, Quantity_Parameter & V1, Quantity_Parameter & U2, Quantity_Parameter & V2) const;

};

%nodefaultctor GeomAPI_PointsToBSplineSurface;
class GeomAPI_PointsToBSplineSurface {
	public:
		%feature("autodoc", "1");
		~GeomAPI_PointsToBSplineSurface();
		%feature("autodoc", "1");
		GeomAPI_PointsToBSplineSurface();
		%feature("autodoc", "1");
		GeomAPI_PointsToBSplineSurface(const TColgp_Array2OfPnt &Points, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol3D=1.0000000000000000208166817117216851329430937767e-3);
		%feature("autodoc", "1");
		GeomAPI_PointsToBSplineSurface(const TColStd_Array2OfReal &ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol3D=1.0000000000000000208166817117216851329430937767e-3);
		%feature("autodoc", "1");
		void Init(const TColgp_Array2OfPnt &Points, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol3D=1.0000000000000000208166817117216851329430937767e-3);
		%feature("autodoc", "1");
		void Interpolate(const TColgp_Array2OfPnt &Points);
		%feature("autodoc", "1");
		void Init(const TColStd_Array2OfReal &ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY, const Standard_Integer DegMin=3, const Standard_Integer DegMax=8, const GeomAbs_Shape Continuity=GeomAbs_C2, const Standard_Real Tol3D=1.0000000000000000208166817117216851329430937767e-3);
		%feature("autodoc", "1");
		void Interpolate(const TColStd_Array2OfReal &ZPoints, const Standard_Real X0, const Standard_Real dX, const Standard_Real Y0, const Standard_Real dY);
		%feature("autodoc", "1");
		const Handle_Geom_BSplineSurface & Surface() const;

};

%nodefaultctor GeomAPI_ExtremaCurveCurve;
class GeomAPI_ExtremaCurveCurve {
	public:
		%feature("autodoc", "1");
		~GeomAPI_ExtremaCurveCurve();
		%feature("autodoc", "1");
		GeomAPI_ExtremaCurveCurve();
		%feature("autodoc", "1");
		GeomAPI_ExtremaCurveCurve(const Handle_Geom_Curve &C1, const Handle_Geom_Curve &C2);
		%feature("autodoc", "1");
		GeomAPI_ExtremaCurveCurve(const Handle_Geom_Curve &C1, const Handle_Geom_Curve &C2, const Quantity_Parameter U1min, const Quantity_Parameter U1max, const Quantity_Parameter U2min, const Quantity_Parameter U2max);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Curve &C1, const Handle_Geom_Curve &C2);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Curve &C1, const Handle_Geom_Curve &C2, const Quantity_Parameter U1min, const Quantity_Parameter U1max, const Quantity_Parameter U2min, const Quantity_Parameter U2max);
		%feature("autodoc", "1");
		Standard_Integer NbExtrema() const;
		%feature("autodoc", "1");
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2) const;
		%feature("autodoc", "1");
		void Parameters(const Standard_Integer Index, Quantity_Parameter & U1, Quantity_Parameter & U2) const;
		%feature("autodoc", "1");
		Quantity_Length Distance(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void NearestPoints(gp_Pnt & P1, gp_Pnt & P2) const;
		%feature("autodoc", "1");
		void LowerDistanceParameters(Quantity_Parameter & U1, Quantity_Parameter & U2) const;
		%feature("autodoc", "1");
		Quantity_Length LowerDistance() const;
		%feature("autodoc", "1");
		const Extrema_ExtCC & Extrema() const;
		%feature("autodoc", "1");
		Standard_Boolean TotalNearestPoints(gp_Pnt & P1, gp_Pnt & P2);
		%feature("autodoc", "1");
		Standard_Boolean TotalLowerDistanceParameters(Quantity_Parameter & U1, Quantity_Parameter & U2);
		%feature("autodoc", "1");
		Quantity_Length TotalLowerDistance();

};

%nodefaultctor GeomAPI_IntSS;
class GeomAPI_IntSS {
	public:
		%feature("autodoc", "1");
		~GeomAPI_IntSS();
		%feature("autodoc", "1");
		GeomAPI_IntSS();
		%feature("autodoc", "1");
		GeomAPI_IntSS(const Handle_Geom_Surface &S1, const Handle_Geom_Surface &S2, const Standard_Real Tol);
		%feature("autodoc", "1");
		void Perform(const Handle_Geom_Surface &S1, const Handle_Geom_Surface &S2, const Standard_Real Tol);
		%feature("autodoc", "1");
		Standard_Boolean IsDone() const;
		%feature("autodoc", "1");
		Standard_Integer NbLines() const;
		%feature("autodoc", "1");
		const Handle_Geom_Curve & Line(const Standard_Integer I) const;

};

%nodefaultctor GeomAPI_ExtremaSurfaceSurface;
class GeomAPI_ExtremaSurfaceSurface {
	public:
		%feature("autodoc", "1");
		~GeomAPI_ExtremaSurfaceSurface();
		%feature("autodoc", "1");
		GeomAPI_ExtremaSurfaceSurface();
		%feature("autodoc", "1");
		GeomAPI_ExtremaSurfaceSurface(const Handle_Geom_Surface &S1, const Handle_Geom_Surface &S2);
		%feature("autodoc", "1");
		GeomAPI_ExtremaSurfaceSurface(const Handle_Geom_Surface &S1, const Handle_Geom_Surface &S2, const Quantity_Parameter U1min, const Quantity_Parameter U1max, const Quantity_Parameter V1min, const Quantity_Parameter V1max, const Quantity_Parameter U2min, const Quantity_Parameter U2max, const Quantity_Parameter V2min, const Quantity_Parameter V2max);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Surface &S1, const Handle_Geom_Surface &S2);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Surface &S1, const Handle_Geom_Surface &S2, const Quantity_Parameter U1min, const Quantity_Parameter U1max, const Quantity_Parameter V1min, const Quantity_Parameter V1max, const Quantity_Parameter U2min, const Quantity_Parameter U2max, const Quantity_Parameter V2min, const Quantity_Parameter V2max);
		%feature("autodoc", "1");
		Standard_Integer NbExtrema() const;
		%feature("autodoc", "1");
		void Points(const Standard_Integer Index, gp_Pnt & P1, gp_Pnt & P2) const;
		%feature("autodoc", "1");
		void Parameters(const Standard_Integer Index, Quantity_Parameter & U1, Quantity_Parameter & V1, Quantity_Parameter & U2, Quantity_Parameter & V2) const;
		%feature("autodoc", "1");
		Quantity_Length Distance(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void NearestPoints(gp_Pnt & P1, gp_Pnt & P2) const;
		%feature("autodoc", "1");
		void LowerDistanceParameters(Quantity_Parameter & U1, Quantity_Parameter & V1, Quantity_Parameter & U2, Quantity_Parameter & V2) const;
		%feature("autodoc", "1");
		Quantity_Length LowerDistance() const;
		%feature("autodoc", "1");
		const Extrema_ExtSS & Extrema() const;

};

%nodefaultctor GeomAPI_ProjectPointOnCurve;
class GeomAPI_ProjectPointOnCurve {
	public:
		%feature("autodoc", "1");
		~GeomAPI_ProjectPointOnCurve();
		%feature("autodoc", "1");
		GeomAPI_ProjectPointOnCurve();
		%feature("autodoc", "1");
		GeomAPI_ProjectPointOnCurve(const gp_Pnt &P, const Handle_Geom_Curve &Curve);
		%feature("autodoc", "1");
		GeomAPI_ProjectPointOnCurve(const gp_Pnt &P, const Handle_Geom_Curve &Curve, const Quantity_Parameter Umin, const Quantity_Parameter Usup);
		%feature("autodoc", "1");
		void Init(const gp_Pnt &P, const Handle_Geom_Curve &Curve);
		%feature("autodoc", "1");
		void Init(const gp_Pnt &P, const Handle_Geom_Curve &Curve, const Quantity_Parameter Umin, const Quantity_Parameter Usup);
		%feature("autodoc", "1");
		void Init(const Handle_Geom_Curve &Curve, const Quantity_Parameter Umin, const Quantity_Parameter Usup);
		%feature("autodoc", "1");
		void Perform(const gp_Pnt &P);
		%feature("autodoc", "1");
		Standard_Integer NbPoints() const;
		%feature("autodoc", "1");
		gp_Pnt Point(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Quantity_Parameter Parameter(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void Parameter(const Standard_Integer Index, Quantity_Parameter & U) const;
		%feature("autodoc", "1");
		Quantity_Length Distance(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		gp_Pnt NearestPoint() const;
		%feature("autodoc", "1");
		Quantity_Parameter LowerDistanceParameter() const;
		%feature("autodoc", "1");
		Quantity_Length LowerDistance() const;
		%feature("autodoc", "1");
		const Extrema_ExtPC & Extrema() const;

};