/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.cyanogenmod.hardware;

import android.content.Context;

public class ThermalMonitor {
    /**
     * Initialize monitor
     */
    public static void initialize(ThermalUpdateCallback callback) {
    }

    /**
     * Whether device supports it
     *
     * @return boolean Supported devices must return always true
     */
    public static boolean isSupported() {
        return false;
    }

    /**
     * This method return the current activation state
     *
     * @return boolean Must be false when feature is not supported or
     * disabled.
     */
    public static boolean isEnabled() {
        return false;
    }
}
