package org.springframework.util;

import java.lang.reflect.GenericArrayType;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.lang.reflect.WildcardType;

/* loaded from: spring-android-core-1.0.1.RELEASE.jar:org/springframework/util/TypeUtils.class */
public abstract class TypeUtils {
    public static boolean isAssignable(Type lhsType, Type rhsType) {
        Assert.notNull(lhsType, "Left-hand side type must not be null");
        Assert.notNull(rhsType, "Right-hand side type must not be null");
        if (lhsType.equals(rhsType) || lhsType.equals(Object.class)) {
            return true;
        }
        if (lhsType instanceof Class) {
            Class<?> lhsClass = (Class) lhsType;
            if (rhsType instanceof Class) {
                return ClassUtils.isAssignable(lhsClass, (Class) rhsType);
            }
            if (rhsType instanceof ParameterizedType) {
                Type rhsRaw = ((ParameterizedType) rhsType).getRawType();
                if (rhsRaw instanceof Class) {
                    return ClassUtils.isAssignable(lhsClass, (Class) rhsRaw);
                }
            } else if (lhsClass.isArray() && (rhsType instanceof GenericArrayType)) {
                Type rhsComponent = ((GenericArrayType) rhsType).getGenericComponentType();
                return isAssignable(lhsClass.getComponentType(), rhsComponent);
            }
        }
        if (lhsType instanceof ParameterizedType) {
            if (rhsType instanceof Class) {
                Type lhsRaw = ((ParameterizedType) lhsType).getRawType();
                if (lhsRaw instanceof Class) {
                    return ClassUtils.isAssignable((Class) lhsRaw, (Class) rhsType);
                }
            } else if (rhsType instanceof ParameterizedType) {
                return isAssignable((ParameterizedType) lhsType, (ParameterizedType) rhsType);
            }
        }
        if (lhsType instanceof GenericArrayType) {
            Type lhsComponent = ((GenericArrayType) lhsType).getGenericComponentType();
            if (rhsType instanceof Class) {
                Class<?> rhsClass = (Class) rhsType;
                if (rhsClass.isArray()) {
                    return isAssignable(lhsComponent, rhsClass.getComponentType());
                }
            } else if (rhsType instanceof GenericArrayType) {
                Type rhsComponent2 = ((GenericArrayType) rhsType).getGenericComponentType();
                return isAssignable(lhsComponent, rhsComponent2);
            }
        }
        if (lhsType instanceof WildcardType) {
            return isAssignable((WildcardType) lhsType, rhsType);
        }
        return false;
    }

    private static boolean isAssignable(ParameterizedType lhsType, ParameterizedType rhsType) {
        if (lhsType.equals(rhsType)) {
            return true;
        }
        Type[] lhsTypeArguments = lhsType.getActualTypeArguments();
        Type[] rhsTypeArguments = rhsType.getActualTypeArguments();
        if (lhsTypeArguments.length != rhsTypeArguments.length) {
            return false;
        }
        int size = lhsTypeArguments.length;
        for (int i = 0; i < size; i++) {
            Type lhsArg = lhsTypeArguments[i];
            Type rhsArg = rhsTypeArguments[i];
            if (!lhsArg.equals(rhsArg) && (!(lhsArg instanceof WildcardType) || !isAssignable((WildcardType) lhsArg, rhsArg))) {
                return false;
            }
        }
        return true;
    }

    private static boolean isAssignable(WildcardType lhsType, Type rhsType) {
        Type[] lUpperBounds = lhsType.getUpperBounds();
        if (lUpperBounds.length == 0) {
            lUpperBounds = new Type[]{Object.class};
        }
        Type[] lLowerBounds = lhsType.getLowerBounds();
        if (lLowerBounds.length == 0) {
            lLowerBounds = new Type[]{null};
        }
        if (rhsType instanceof WildcardType) {
            WildcardType rhsWcType = (WildcardType) rhsType;
            Type[] rUpperBounds = rhsWcType.getUpperBounds();
            if (rUpperBounds.length == 0) {
                rUpperBounds = new Type[]{Object.class};
            }
            Type[] rLowerBounds = rhsWcType.getLowerBounds();
            if (rLowerBounds.length == 0) {
                rLowerBounds = new Type[]{null};
            }
            Type[] arr$ = lUpperBounds;
            for (Type lBound : arr$) {
                Type[] arr$2 = rUpperBounds;
                for (Type rBound : arr$2) {
                    if (!isAssignableBound(lBound, rBound)) {
                        return false;
                    }
                }
                Type[] arr$3 = rLowerBounds;
                for (Type rBound2 : arr$3) {
                    if (!isAssignableBound(lBound, rBound2)) {
                        return false;
                    }
                }
            }
            Type[] arr$4 = lLowerBounds;
            for (Type lBound2 : arr$4) {
                Type[] arr$5 = rUpperBounds;
                for (Type rBound3 : arr$5) {
                    if (!isAssignableBound(rBound3, lBound2)) {
                        return false;
                    }
                }
                Type[] arr$6 = rLowerBounds;
                for (Type rBound4 : arr$6) {
                    if (!isAssignableBound(rBound4, lBound2)) {
                        return false;
                    }
                }
            }
            return true;
        }
        Type[] arr$7 = lUpperBounds;
        for (Type lBound3 : arr$7) {
            if (!isAssignableBound(lBound3, rhsType)) {
                return false;
            }
        }
        Type[] arr$8 = lLowerBounds;
        for (Type lBound4 : arr$8) {
            if (!isAssignableBound(rhsType, lBound4)) {
                return false;
            }
        }
        return true;
    }

    public static boolean isAssignableBound(Type lhsType, Type rhsType) {
        if (rhsType == null) {
            return true;
        }
        if (lhsType == null) {
            return false;
        }
        return isAssignable(lhsType, rhsType);
    }
}
