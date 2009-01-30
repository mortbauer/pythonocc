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
%module TopLoc

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


%include TopLoc_dependencies.i


%include TopLoc_headers.i

typedef gp_Trsf * TopLoc_TrsfPtr;



%nodefaultctor Handle_TopLoc_SListNodeOfSListOfItemLocation;
class Handle_TopLoc_SListNodeOfSListOfItemLocation : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TopLoc_SListNodeOfSListOfItemLocation();
		%feature("autodoc", "1");
		Handle_TopLoc_SListNodeOfSListOfItemLocation();
		%feature("autodoc", "1");
		Handle_TopLoc_SListNodeOfSListOfItemLocation(const Handle_TopLoc_SListNodeOfSListOfItemLocation &aHandle);
		%feature("autodoc", "1");
		Handle_TopLoc_SListNodeOfSListOfItemLocation(const TopLoc_SListNodeOfSListOfItemLocation *anItem);
		%feature("autodoc", "1");
		Handle_TopLoc_SListNodeOfSListOfItemLocation const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopLoc_SListNodeOfSListOfItemLocation {
	TopLoc_SListNodeOfSListOfItemLocation* GetObject() {
	return (TopLoc_SListNodeOfSListOfItemLocation*)$self->Access();
	}
};

%nodefaultctor Handle_TopLoc_Datum3D;
class Handle_TopLoc_Datum3D : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TopLoc_Datum3D();
		%feature("autodoc", "1");
		Handle_TopLoc_Datum3D();
		%feature("autodoc", "1");
		Handle_TopLoc_Datum3D(const Handle_TopLoc_Datum3D &aHandle);
		%feature("autodoc", "1");
		Handle_TopLoc_Datum3D(const TopLoc_Datum3D *anItem);
		%feature("autodoc", "1");
		Handle_TopLoc_Datum3D const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopLoc_Datum3D {
	TopLoc_Datum3D* GetObject() {
	return (TopLoc_Datum3D*)$self->Access();
	}
};

%nodefaultctor Handle_TopLoc_StdMapNodeOfMapOfLocation;
class Handle_TopLoc_StdMapNodeOfMapOfLocation : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TopLoc_StdMapNodeOfMapOfLocation();
		%feature("autodoc", "1");
		Handle_TopLoc_StdMapNodeOfMapOfLocation();
		%feature("autodoc", "1");
		Handle_TopLoc_StdMapNodeOfMapOfLocation(const Handle_TopLoc_StdMapNodeOfMapOfLocation &aHandle);
		%feature("autodoc", "1");
		Handle_TopLoc_StdMapNodeOfMapOfLocation(const TopLoc_StdMapNodeOfMapOfLocation *anItem);
		%feature("autodoc", "1");
		Handle_TopLoc_StdMapNodeOfMapOfLocation const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopLoc_StdMapNodeOfMapOfLocation {
	TopLoc_StdMapNodeOfMapOfLocation* GetObject() {
	return (TopLoc_StdMapNodeOfMapOfLocation*)$self->Access();
	}
};

%nodefaultctor Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation;
class Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation : public Handle_TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		~Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation();
		%feature("autodoc", "1");
		Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation();
		%feature("autodoc", "1");
		Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation(const Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation &aHandle);
		%feature("autodoc", "1");
		Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation(const TopLoc_IndexedMapNodeOfIndexedMapOfLocation *anItem);
		%feature("autodoc", "1");
		Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation {
	TopLoc_IndexedMapNodeOfIndexedMapOfLocation* GetObject() {
	return (TopLoc_IndexedMapNodeOfIndexedMapOfLocation*)$self->Access();
	}
};

%nodefaultctor TopLoc_IndexedMapNodeOfIndexedMapOfLocation;
class TopLoc_IndexedMapNodeOfIndexedMapOfLocation : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TopLoc_IndexedMapNodeOfIndexedMapOfLocation(const TopLoc_Location &K1, const Standard_Integer K2, const TCollection_MapNodePtr &n1, const TCollection_MapNodePtr &n2);
		%feature("autodoc", "1");
		TopLoc_Location & Key1() const;
		%feature("autodoc", "1");
		Standard_Integer & Key2() const;
		%feature("autodoc", "1");
		TCollection_MapNodePtr & Next2() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TopLoc_IndexedMapNodeOfIndexedMapOfLocation();

};
%extend TopLoc_IndexedMapNodeOfIndexedMapOfLocation {
	Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation GetHandle() {
	return *(Handle_TopLoc_IndexedMapNodeOfIndexedMapOfLocation*) &$self;
	}
};

%nodefaultctor TopLoc_MapOfLocation;
class TopLoc_MapOfLocation : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TopLoc_MapOfLocation(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TopLoc_MapOfLocation & Assign(const TopLoc_MapOfLocation &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TopLoc_MapOfLocation();
		%feature("autodoc", "1");
		Standard_Boolean Add(const TopLoc_Location &aKey);
		%feature("autodoc", "1");
		Standard_Boolean Contains(const TopLoc_Location &aKey) const;
		%feature("autodoc", "1");
		Standard_Boolean Remove(const TopLoc_Location &aKey);

};

%nodefaultctor TopLoc_IndexedMapOfLocation;
class TopLoc_IndexedMapOfLocation : public TCollection_BasicMap {
	public:
		%feature("autodoc", "1");
		TopLoc_IndexedMapOfLocation(const Standard_Integer NbBuckets=1);
		%feature("autodoc", "1");
		TopLoc_IndexedMapOfLocation & Assign(const TopLoc_IndexedMapOfLocation &Other);
		%feature("autodoc", "1");
		void ReSize(const Standard_Integer NbBuckets);
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TopLoc_IndexedMapOfLocation();
		%feature("autodoc", "1");
		Standard_Integer Add(const TopLoc_Location &K);
		%feature("autodoc", "1");
		void Substitute(const Standard_Integer I, const TopLoc_Location &K);
		%feature("autodoc", "1");
		void RemoveLast();
		%feature("autodoc", "1");
		Standard_Boolean Contains(const TopLoc_Location &K) const;
		%feature("autodoc", "1");
		const TopLoc_Location & FindKey(const Standard_Integer I) const;
		%feature("autodoc", "1");
		const TopLoc_Location & operator()(const Standard_Integer I) const;
		%feature("autodoc", "1");
		Standard_Integer FindIndex(const TopLoc_Location &K) const;

};

%nodefaultctor TopLoc_MapIteratorOfMapOfLocation;
class TopLoc_MapIteratorOfMapOfLocation : public TCollection_BasicMapIterator {
	public:
		%feature("autodoc", "1");
		~TopLoc_MapIteratorOfMapOfLocation();
		%feature("autodoc", "1");
		TopLoc_MapIteratorOfMapOfLocation();
		%feature("autodoc", "1");
		TopLoc_MapIteratorOfMapOfLocation(const TopLoc_MapOfLocation &aMap);
		%feature("autodoc", "1");
		void Initialize(const TopLoc_MapOfLocation &aMap);
		%feature("autodoc", "1");
		const TopLoc_Location & Key() const;

};

%nodefaultctor TopLoc_MapLocationHasher;
class TopLoc_MapLocationHasher {
	public:
		%feature("autodoc", "1");
		~TopLoc_MapLocationHasher();
		%feature("autodoc", "1");
		TopLoc_MapLocationHasher();
		%feature("autodoc", "1");
		Standard_Integer HashCode(const TopLoc_Location &K, const Standard_Integer Upper);
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const TopLoc_Location &K1, const TopLoc_Location &K2);

};

%nodefaultctor TopLoc_Location;
class TopLoc_Location {
	public:
		%feature("autodoc", "1");
		~TopLoc_Location();
		%feature("autodoc", "1");
		TopLoc_Location();
		%feature("autodoc", "1");
		TopLoc_Location(const gp_Trsf &T);
		%feature("autodoc", "1");
		TopLoc_Location(const Handle_TopLoc_Datum3D &D);
		%feature("autodoc", "1");
		Standard_Boolean IsIdentity() const;
		%feature("autodoc", "1");
		void Identity();
		%feature("autodoc", "1");
		const Handle_TopLoc_Datum3D & FirstDatum() const;
		%feature("autodoc", "1");
		Standard_Integer FirstPower() const;
		%feature("autodoc", "1");
		const TopLoc_Location & NextLocation() const;
		%feature("autodoc", "1");
		const gp_Trsf & Transformation() const;
		%feature("autodoc", "1");
		TopLoc_Location Inverted() const;
		%feature("autodoc", "1");
		TopLoc_Location Multiplied(const TopLoc_Location &Other) const;
		%feature("autodoc", "1");
		TopLoc_Location operator*(const TopLoc_Location &Other) const;
		%feature("autodoc", "1");
		TopLoc_Location Divided(const TopLoc_Location &Other) const;
		%feature("autodoc", "1");
		TopLoc_Location operator/(const TopLoc_Location &Other) const;
		%feature("autodoc", "1");
		TopLoc_Location Predivided(const TopLoc_Location &Other) const;
		%feature("autodoc", "1");
		TopLoc_Location Powered(const Standard_Integer pwr) const;
		%feature("autodoc", "1");
		Standard_Integer HashCode(const Standard_Integer Upper) const;
		%feature("autodoc", "1");
		Standard_Boolean IsEqual(const TopLoc_Location &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean IsDifferent(const TopLoc_Location &Other) const;
		%feature("autodoc", "1");
		Standard_Boolean operator!=(const TopLoc_Location &Other) const;
		%feature("autodoc", "1");
		void ShallowDump(Standard_OStream & S) const;

};

%nodefaultctor TopLoc_StdMapNodeOfMapOfLocation;
class TopLoc_StdMapNodeOfMapOfLocation : public TCollection_MapNode {
	public:
		%feature("autodoc", "1");
		TopLoc_StdMapNodeOfMapOfLocation(const TopLoc_Location &K, const TCollection_MapNodePtr &n);
		%feature("autodoc", "1");
		TopLoc_Location & Key() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TopLoc_StdMapNodeOfMapOfLocation();

};
%extend TopLoc_StdMapNodeOfMapOfLocation {
	Handle_TopLoc_StdMapNodeOfMapOfLocation GetHandle() {
	return *(Handle_TopLoc_StdMapNodeOfMapOfLocation*) &$self;
	}
};

%nodefaultctor TopLoc_SListOfItemLocation;
class TopLoc_SListOfItemLocation {
	public:
		%feature("autodoc", "1");
		TopLoc_SListOfItemLocation();
		%feature("autodoc", "1");
		TopLoc_SListOfItemLocation(const TopLoc_ItemLocation &anItem, const TopLoc_SListOfItemLocation &aTail);
		%feature("autodoc", "1");
		TopLoc_SListOfItemLocation(const TopLoc_SListOfItemLocation &Other);
		%feature("autodoc", "1");
		TopLoc_SListOfItemLocation & Assign(const TopLoc_SListOfItemLocation &Other);
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TopLoc_SListOfItemLocation();
		%feature("autodoc", "1");
		const TopLoc_ItemLocation & Value() const;
		%feature("autodoc", "1");
		TopLoc_ItemLocation & ChangeValue();
		%feature("autodoc", "1");
		void SetValue(const TopLoc_ItemLocation &anItem);
		%feature("autodoc", "1");
		const TopLoc_SListOfItemLocation & Tail() const;
		%feature("autodoc", "1");
		TopLoc_SListOfItemLocation & ChangeTail();
		%feature("autodoc", "1");
		void SetTail(const TopLoc_SListOfItemLocation &aList);
		%feature("autodoc", "1");
		void Construct(const TopLoc_ItemLocation &anItem);
		%feature("autodoc", "1");
		TopLoc_SListOfItemLocation Constructed(const TopLoc_ItemLocation &anItem) const;
		%feature("autodoc", "1");
		void ToTail();
		%feature("autodoc", "1");
		void Initialize(const TopLoc_SListOfItemLocation &aList);
		%feature("autodoc", "1");
		Standard_Boolean More() const;
		%feature("autodoc", "1");
		void Next();

};

%nodefaultctor TopLoc_ItemLocation;
class TopLoc_ItemLocation {
	public:
		%feature("autodoc", "1");
		TopLoc_ItemLocation(const Handle_TopLoc_Datum3D &D, const Standard_Integer P, const Standard_Boolean fromTrsf=0);
		%feature("autodoc", "1");
		TopLoc_ItemLocation(const TopLoc_ItemLocation &anOther);
		%feature("autodoc", "1");
		TopLoc_ItemLocation & Assign(const TopLoc_ItemLocation &anOther);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TopLoc_ItemLocation();

};

%nodefaultctor TopLoc_Datum3D;
class TopLoc_Datum3D : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TopLoc_Datum3D();
		%feature("autodoc", "1");
		TopLoc_Datum3D(const gp_Trsf &T);
		%feature("autodoc", "1");
		const gp_Trsf & Transformation() const;
		%feature("autodoc", "1");
		virtual		void ShallowDump(Standard_OStream & S) const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TopLoc_Datum3D();

};
%extend TopLoc_Datum3D {
	Handle_TopLoc_Datum3D GetHandle() {
	return *(Handle_TopLoc_Datum3D*) &$self;
	}
};