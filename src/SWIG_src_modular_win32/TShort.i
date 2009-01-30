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
%module TShort

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


%include TShort_dependencies.i


%include TShort_headers.i




%nodefaultctor Handle_TShort_HSequenceOfShortReal;
class Handle_TShort_HSequenceOfShortReal : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TShort_HSequenceOfShortReal();
		%feature("autodoc", "1");
		Handle_TShort_HSequenceOfShortReal();
		%feature("autodoc", "1");
		Handle_TShort_HSequenceOfShortReal(const Handle_TShort_HSequenceOfShortReal &aHandle);
		%feature("autodoc", "1");
		Handle_TShort_HSequenceOfShortReal(const TShort_HSequenceOfShortReal *anItem);
		%feature("autodoc", "1");
		Handle_TShort_HSequenceOfShortReal const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TShort_HSequenceOfShortReal {
	TShort_HSequenceOfShortReal* GetObject() {
	return (TShort_HSequenceOfShortReal*)$self->Access();
	}
};

%nodefaultctor Handle_TShort_HArray1OfShortReal;
class Handle_TShort_HArray1OfShortReal : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TShort_HArray1OfShortReal();
		%feature("autodoc", "1");
		Handle_TShort_HArray1OfShortReal();
		%feature("autodoc", "1");
		Handle_TShort_HArray1OfShortReal(const Handle_TShort_HArray1OfShortReal &aHandle);
		%feature("autodoc", "1");
		Handle_TShort_HArray1OfShortReal(const TShort_HArray1OfShortReal *anItem);
		%feature("autodoc", "1");
		Handle_TShort_HArray1OfShortReal const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TShort_HArray1OfShortReal {
	TShort_HArray1OfShortReal* GetObject() {
	return (TShort_HArray1OfShortReal*)$self->Access();
	}
};

%nodefaultctor Handle_TShort_SequenceNodeOfSequenceOfShortReal;
class Handle_TShort_SequenceNodeOfSequenceOfShortReal : public Handle_TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		~Handle_TShort_SequenceNodeOfSequenceOfShortReal();
		%feature("autodoc", "1");
		Handle_TShort_SequenceNodeOfSequenceOfShortReal();
		%feature("autodoc", "1");
		Handle_TShort_SequenceNodeOfSequenceOfShortReal(const Handle_TShort_SequenceNodeOfSequenceOfShortReal &aHandle);
		%feature("autodoc", "1");
		Handle_TShort_SequenceNodeOfSequenceOfShortReal(const TShort_SequenceNodeOfSequenceOfShortReal *anItem);
		%feature("autodoc", "1");
		Handle_TShort_SequenceNodeOfSequenceOfShortReal const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TShort_SequenceNodeOfSequenceOfShortReal {
	TShort_SequenceNodeOfSequenceOfShortReal* GetObject() {
	return (TShort_SequenceNodeOfSequenceOfShortReal*)$self->Access();
	}
};

%nodefaultctor Handle_TShort_HArray2OfShortReal;
class Handle_TShort_HArray2OfShortReal : public Handle_MMgt_TShared {
	public:
		%feature("autodoc", "1");
		~Handle_TShort_HArray2OfShortReal();
		%feature("autodoc", "1");
		Handle_TShort_HArray2OfShortReal();
		%feature("autodoc", "1");
		Handle_TShort_HArray2OfShortReal(const Handle_TShort_HArray2OfShortReal &aHandle);
		%feature("autodoc", "1");
		Handle_TShort_HArray2OfShortReal(const TShort_HArray2OfShortReal *anItem);
		%feature("autodoc", "1");
		Handle_TShort_HArray2OfShortReal const DownCast(const Handle_Standard_Transient &AnObject);

};
%extend Handle_TShort_HArray2OfShortReal {
	TShort_HArray2OfShortReal* GetObject() {
	return (TShort_HArray2OfShortReal*)$self->Access();
	}
};

%nodefaultctor TShort_HArray1OfShortReal;
class TShort_HArray1OfShortReal : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TShort_HArray1OfShortReal(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TShort_HArray1OfShortReal(const Standard_Integer Low, const Standard_Integer Up, const Standard_ShortReal &V);
		%feature("autodoc", "1");
		void Init(const Standard_ShortReal &V);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Standard_ShortReal &Value);
		%feature("autodoc", "1");
		const Standard_ShortReal & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_ShortReal & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		const TShort_Array1OfShortReal & Array1() const;
		%feature("autodoc", "1");
		TShort_Array1OfShortReal & ChangeArray1();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TShort_HArray1OfShortReal();

};
%extend TShort_HArray1OfShortReal {
	Handle_TShort_HArray1OfShortReal GetHandle() {
	return *(Handle_TShort_HArray1OfShortReal*) &$self;
	}
};

%nodefaultctor TShort_SequenceOfShortReal;
class TShort_SequenceOfShortReal : public TCollection_BaseSequence {
	public:
		%feature("autodoc", "1");
		TShort_SequenceOfShortReal();
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		~TShort_SequenceOfShortReal();
		%feature("autodoc", "1");
		const TShort_SequenceOfShortReal & Assign(const TShort_SequenceOfShortReal &Other);
		%feature("autodoc", "1");
		void Append(const Standard_ShortReal &T);
		%feature("autodoc", "1");
		void Append(TShort_SequenceOfShortReal & S);
		%feature("autodoc", "1");
		void Prepend(const Standard_ShortReal &T);
		%feature("autodoc", "1");
		void Prepend(TShort_SequenceOfShortReal & S);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, const Standard_ShortReal &I);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer Index, TShort_SequenceOfShortReal & S);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, const Standard_ShortReal &T);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer Index, TShort_SequenceOfShortReal & S);
		%feature("autodoc", "1");
		const Standard_ShortReal & First() const;
		%feature("autodoc", "1");
		const Standard_ShortReal & Last() const;
		%feature("autodoc", "1");
		void Split(const Standard_Integer Index, TShort_SequenceOfShortReal & S);
		%feature("autodoc", "1");
		const Standard_ShortReal & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Standard_ShortReal & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Standard_ShortReal &I);
		%feature("autodoc", "1");
		Standard_ShortReal & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Standard_ShortReal & operator()(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer Index);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer FromIndex, const Standard_Integer ToIndex);

};

%nodefaultctor TShort_Array1OfShortReal;
class TShort_Array1OfShortReal {
	public:
		%feature("autodoc", "1");
		TShort_Array1OfShortReal(const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		TShort_Array1OfShortReal(const Standard_ShortReal &Item, const Standard_Integer Low, const Standard_Integer Up);
		%feature("autodoc", "1");
		void Init(const Standard_ShortReal &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TShort_Array1OfShortReal();
		%feature("autodoc", "1");
		Standard_Boolean IsAllocated() const;
		%feature("autodoc", "1");
		const TShort_Array1OfShortReal & Assign(const TShort_Array1OfShortReal &Other);
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		Standard_Integer Lower() const;
		%feature("autodoc", "1");
		Standard_Integer Upper() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Index, const Standard_ShortReal &Value);
		%feature("autodoc", "1");
		const Standard_ShortReal & Value(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		const Standard_ShortReal & operator()(const Standard_Integer Index) const;
		%feature("autodoc", "1");
		Standard_ShortReal & ChangeValue(const Standard_Integer Index);
		%feature("autodoc", "1");
		Standard_ShortReal & operator()(const Standard_Integer Index);

};

%nodefaultctor TShort_SequenceNodeOfSequenceOfShortReal;
class TShort_SequenceNodeOfSequenceOfShortReal : public TCollection_SeqNode {
	public:
		%feature("autodoc", "1");
		TShort_SequenceNodeOfSequenceOfShortReal(const Standard_ShortReal &I, const TCollection_SeqNodePtr &n, const TCollection_SeqNodePtr &p);
		%feature("autodoc", "1");
		Standard_ShortReal & Value() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TShort_SequenceNodeOfSequenceOfShortReal();

};
%extend TShort_SequenceNodeOfSequenceOfShortReal {
	Handle_TShort_SequenceNodeOfSequenceOfShortReal GetHandle() {
	return *(Handle_TShort_SequenceNodeOfSequenceOfShortReal*) &$self;
	}
};

%nodefaultctor TShort_HArray2OfShortReal;
class TShort_HArray2OfShortReal : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TShort_HArray2OfShortReal(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TShort_HArray2OfShortReal(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2, const Standard_ShortReal &V);
		%feature("autodoc", "1");
		void Init(const Standard_ShortReal &V);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Standard_ShortReal &Value);
		%feature("autodoc", "1");
		const Standard_ShortReal & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Standard_ShortReal & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		const TShort_Array2OfShortReal & Array2() const;
		%feature("autodoc", "1");
		TShort_Array2OfShortReal & ChangeArray2();
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TShort_HArray2OfShortReal();

};
%extend TShort_HArray2OfShortReal {
	Handle_TShort_HArray2OfShortReal GetHandle() {
	return *(Handle_TShort_HArray2OfShortReal*) &$self;
	}
};

%nodefaultctor TShort_HSequenceOfShortReal;
class TShort_HSequenceOfShortReal : public MMgt_TShared {
	public:
		%feature("autodoc", "1");
		TShort_HSequenceOfShortReal();
		%feature("autodoc", "1");
		Standard_Boolean IsEmpty() const;
		%feature("autodoc", "1");
		Standard_Integer Length() const;
		%feature("autodoc", "1");
		void Clear();
		%feature("autodoc", "1");
		void Append(const Standard_ShortReal &anItem);
		%feature("autodoc", "1");
		void Append(const Handle_TShort_HSequenceOfShortReal &aSequence);
		%feature("autodoc", "1");
		void Prepend(const Standard_ShortReal &anItem);
		%feature("autodoc", "1");
		void Prepend(const Handle_TShort_HSequenceOfShortReal &aSequence);
		%feature("autodoc", "1");
		void Reverse();
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Standard_ShortReal &anItem);
		%feature("autodoc", "1");
		void InsertBefore(const Standard_Integer anIndex, const Handle_TShort_HSequenceOfShortReal &aSequence);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Standard_ShortReal &anItem);
		%feature("autodoc", "1");
		void InsertAfter(const Standard_Integer anIndex, const Handle_TShort_HSequenceOfShortReal &aSequence);
		%feature("autodoc", "1");
		void Exchange(const Standard_Integer anIndex, const Standard_Integer anOtherIndex);
		%feature("autodoc", "1");
		Handle_TShort_HSequenceOfShortReal Split(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer anIndex, const Standard_ShortReal &anItem);
		%feature("autodoc", "1");
		const Standard_ShortReal & Value(const Standard_Integer anIndex) const;
		%feature("autodoc", "1");
		Standard_ShortReal & ChangeValue(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer anIndex);
		%feature("autodoc", "1");
		void Remove(const Standard_Integer fromIndex, const Standard_Integer toIndex);
		%feature("autodoc", "1");
		const TShort_SequenceOfShortReal & Sequence() const;
		%feature("autodoc", "1");
		TShort_SequenceOfShortReal & ChangeSequence();
		%feature("autodoc", "1");
		Handle_TShort_HSequenceOfShortReal ShallowCopy() const;
		%feature("autodoc", "1");
		virtual		const Handle_Standard_Type & DynamicType() const;
		%feature("autodoc", "1");
		virtual		~TShort_HSequenceOfShortReal();

};
%extend TShort_HSequenceOfShortReal {
	Handle_TShort_HSequenceOfShortReal GetHandle() {
	return *(Handle_TShort_HSequenceOfShortReal*) &$self;
	}
};

%nodefaultctor TShort_Array2OfShortReal;
class TShort_Array2OfShortReal {
	public:
		%feature("autodoc", "1");
		TShort_Array2OfShortReal(const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		TShort_Array2OfShortReal(const Standard_ShortReal &Item, const Standard_Integer R1, const Standard_Integer R2, const Standard_Integer C1, const Standard_Integer C2);
		%feature("autodoc", "1");
		void Init(const Standard_ShortReal &V);
		%feature("autodoc", "1");
		void Destroy();
		%feature("autodoc", "1");
		~TShort_Array2OfShortReal();
		%feature("autodoc", "1");
		const TShort_Array2OfShortReal & Assign(const TShort_Array2OfShortReal &Other);
		%feature("autodoc", "1");
		Standard_Integer ColLength() const;
		%feature("autodoc", "1");
		Standard_Integer RowLength() const;
		%feature("autodoc", "1");
		Standard_Integer LowerCol() const;
		%feature("autodoc", "1");
		Standard_Integer LowerRow() const;
		%feature("autodoc", "1");
		Standard_Integer UpperCol() const;
		%feature("autodoc", "1");
		Standard_Integer UpperRow() const;
		%feature("autodoc", "1");
		void SetValue(const Standard_Integer Row, const Standard_Integer Col, const Standard_ShortReal &Value);
		%feature("autodoc", "1");
		const Standard_ShortReal & Value(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		const Standard_ShortReal & operator()(const Standard_Integer Row, const Standard_Integer Col) const;
		%feature("autodoc", "1");
		Standard_ShortReal & ChangeValue(const Standard_Integer Row, const Standard_Integer Col);
		%feature("autodoc", "1");
		Standard_ShortReal & operator()(const Standard_Integer Row, const Standard_Integer Col);

};