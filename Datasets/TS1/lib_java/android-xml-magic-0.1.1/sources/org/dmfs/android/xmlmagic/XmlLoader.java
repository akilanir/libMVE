package org.dmfs.android.xmlmagic;

import android.app.Activity;
import android.app.Notification;
import android.app.Service;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import java.io.IOException;
import org.dmfs.android.xmlmagic.builder.RecyclingReflectionObjectBuilder;
import org.dmfs.android.xmlmagic.tokenresolvers.AndroidTokenResolver;
import org.dmfs.android.xmlmagic.tokenresolvers.ITokenResolver;
import org.dmfs.xmlobjects.ElementDescriptor;
import org.dmfs.xmlobjects.QualifiedName;
import org.dmfs.xmlobjects.XmlContext;
import org.dmfs.xmlobjects.pull.XmlObjectPull;
import org.dmfs.xmlobjects.pull.XmlObjectPullParserException;
import org.dmfs.xmlobjects.pull.XmlPath;
import org.xmlpull.v1.XmlPullParserException;

/* loaded from: android-xml-magic-0.1.1.jar:org/dmfs/android/xmlmagic/XmlLoader.class */
public class XmlLoader {
    private static final XmlPath EMPTY_PATH = new XmlPath(new ElementDescriptor[0]);

    public static void populate(Activity activity) {
        try {
            int i = activity.getPackageManager().getActivityInfo(activity.getComponentName(), 129).metaData.getInt("org.dmfs.ACTIVITY_PARAMETERS");
            if (i != 0) {
                populate(activity, i);
            }
        } catch (PackageManager.NameNotFoundException e) {
        }
    }

    public static void populate(Activity activity, ITokenResolver iTokenResolver) {
        try {
            int i = activity.getPackageManager().getActivityInfo(activity.getComponentName(), 129).metaData.getInt("org.dmfs.ACTIVITY_PARAMETERS");
            if (i != 0) {
                populate(activity, i, iTokenResolver);
            }
        } catch (PackageManager.NameNotFoundException e) {
        }
    }

    public static void populate(Activity activity, int i) {
        populate(activity, i, (ITokenResolver) null);
    }

    public static void populate(Activity activity, int i, ITokenResolver iTokenResolver) {
        XmlContext xmlContext = new XmlContext();
        ElementDescriptor register = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "activity"), new RecyclingReflectionObjectBuilder(activity.getClass()), xmlContext);
        try {
            XmlObjectPull parser = getParser(activity, i, iTokenResolver);
            parser.setContext(xmlContext);
            parser.pull(register, activity, EMPTY_PATH);
        } catch (Exception e) {
            throw new RuntimeException("could not populate activity", e);
        }
    }

    public static void populate(Service service) {
        try {
            int i = service.getPackageManager().getServiceInfo(new ComponentName(service, service.getClass()), 132).metaData.getInt("org.dmfs.SERVICE_PARAMETERS");
            if (i != 0) {
                populate(service, i);
            }
        } catch (PackageManager.NameNotFoundException e) {
        }
    }

    public static void populate(Service service, int i) {
        populate(service, i, (ITokenResolver) null);
    }

    public static void populate(Service service, ITokenResolver iTokenResolver) {
        try {
            int i = service.getPackageManager().getServiceInfo(new ComponentName(service, service.getClass()), 132).metaData.getInt("org.dmfs.SERVICE_PARAMETERS");
            if (i != 0) {
                populate(service, i, iTokenResolver);
            }
        } catch (PackageManager.NameNotFoundException e) {
        }
    }

    public static void populate(Service service, int i, ITokenResolver iTokenResolver) {
        XmlContext xmlContext = new XmlContext();
        ElementDescriptor register = ElementDescriptor.register(QualifiedName.get(Model.NAMESPACE, "service"), new RecyclingReflectionObjectBuilder(service.getClass()), xmlContext);
        try {
            XmlObjectPull parser = getParser(service, i, iTokenResolver);
            parser.setContext(xmlContext);
            parser.pull(register, service, EMPTY_PATH);
        } catch (Exception e) {
            throw new RuntimeException("could not populate service", e);
        }
    }

    public static Notification loadNotification(Context context, int i, ITokenResolver... iTokenResolverArr) throws IOException, XmlPullParserException, XmlObjectPullParserException {
        return (Notification) getParser(context, i, iTokenResolverArr).pull(Model.NOTIFICATION, (Object) null, EMPTY_PATH);
    }

    public static Intent loadIntent(Context context, int i, ITokenResolver... iTokenResolverArr) throws IOException, XmlPullParserException, XmlObjectPullParserException {
        return (Intent) getParser(context, i, iTokenResolverArr).pull(Model.INTENT, (Object) null, EMPTY_PATH);
    }

    public static Bundle loadBundle(Context context, int i, ITokenResolver... iTokenResolverArr) throws IOException, XmlPullParserException, XmlObjectPullParserException {
        return (Bundle) getParser(context, i, iTokenResolverArr).pull(Model.BUNDLE, (Object) null, EMPTY_PATH);
    }

    private static XmlObjectPull getParser(Context context, int i, ITokenResolver... iTokenResolverArr) throws IOException, XmlPullParserException, XmlObjectPullParserException {
        return new XmlObjectPull(context.getResources().getXml(i), (iTokenResolverArr == null || iTokenResolverArr.length <= 0) ? new AndroidParserContext(context, null) : new AndroidParserContext(context, new AndroidTokenResolver(context).setResolvers(iTokenResolverArr)));
    }
}
