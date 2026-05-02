package org.dmfs.provider.tasks.handler;

import org.dmfs.provider.tasks.TaskContract;

/* loaded from: opentasks-provider-1.1.8.1.jar:org/dmfs/provider/tasks/handler/PropertyHandlerFactory.class */
public class PropertyHandlerFactory {
    private static final PropertyHandler CATEGORY_HANDLER = new CategoryHandler();
    private static final PropertyHandler ALARM_HANDLER = new AlarmHandler();
    private static final PropertyHandler RELATION_HANDLER = new RelationHandler();
    private static final PropertyHandler DEFAULT_PROPERTY_HANDLER = new DefaultPropertyHandler();

    public static PropertyHandler get(String str) {
        return TaskContract.Property.Category.CONTENT_ITEM_TYPE.equals(str) ? CATEGORY_HANDLER : TaskContract.Property.Alarm.CONTENT_ITEM_TYPE.equals(str) ? ALARM_HANDLER : TaskContract.Property.Relation.CONTENT_ITEM_TYPE.equals(str) ? RELATION_HANDLER : DEFAULT_PROPERTY_HANDLER;
    }
}
