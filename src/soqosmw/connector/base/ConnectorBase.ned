//
// c Timo Haeckel for HAW Hamburg
// 
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU Lesser General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
// 
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU Lesser General Public License for more details.
// 
// You should have received a copy of the GNU Lesser General Public License
// along with this program.  If not, see http://www.gnu.org/licenses/.
// 

package soqosmw.connector.base;

//
// The ConnectorBase provides a common interface for all connctor modules.
// Those modules are created by the LocalServiceManager module (@see~LocalServiceManager)
// during runtime to connect a service application to its protocol specific service endpoints.
//
// @author Timo Haeckel and Mehmet Cakir for HAW Hamburg
//
simple ConnectorBase
{
    parameters:
        // maximum number of appilcations allowed to connect to this connector.
        // -1 = infinite
        int maxApplications = default(-1);
        // maximum number of endpoints allowed to connect to this connector.
        // -1 = infinite
        int maxEndpoints = default(-1);

        // Indicates if messages should be forwarded to applications.
        bool applicationFwdEnabled = default(true);
        // Indicates if messages should be forwarded to endpoints.
        bool endpointFwdEnabled = default(true);
        // Indicates if connector mapping should be created after simulation
        bool createConnectorMappingEnabled =  default(false);

        // Signal emitted when a message is forwarded to Endpoints
        @signal[forwardedToEPs](type=omnetpp::cPacket);
        //Statistic of the amount of messages that were forwarded to endpoints
        @statistic[fwdToEPs](title="Forwarded to EPs"; source=forwardedToEPs; record=count; unit=packets);
        //Statistic of the amount of bytes that were forwarded to endpoints
        @statistic[fwdToEPsBytes](title="Fowarded Bytes"; source=forwardedToEPs; unit=B; record="sum(packetBytes)","vector(packetBytes)","histogram(packetBytes)?","floatingIntervalSumVector(packetBytes)?"; interpolationmode=none); //possible parameter e.g.: **.floatingintervalvectorrecorder-measure-interval = 20ms for floatingIntervalRecorders
        //End-to-end latency
        @statistic[fwdToEPsLatency](title="End-to-end latency"; source="messageAge(forwardedToEPs)"; unit=s; record=stats,histogram?,vector; interpolationmode=none);

        // Signal emitted when a message is forwarded to Applications
        @signal[forwardedToApps](type=omnetpp::cPacket);
        //Statistic of the amount of messages that were forwarded to applications
        @statistic[fwdToApps](title="Forwarded to Apps"; source=forwardedToApps; record=count; unit=packets);
        //Statistic of the amount of bytes that were forwarded to applications
        @statistic[fwdToAppsBytes](title="Forwarded Bytes"; source=forwardedToApps; unit=B; record="sum(packetBytes)","vector(packetBytes)","histogram(packetBytes)?","floatingIntervalSumVector(packetBytes)?"; interpolationmode=none); //possible parameter e.g.: **.floatingintervalvectorrecorder-measure-interval = 20ms for floatingIntervalRecorders
        //End-to-end latency
        @statistic[fwdToAppsLatency](title="End-to-end latency"; source="messageAge(forwardedToApps)"; unit=s; record=stats,histogram?,vector; interpolationmode=none);

        // Signal emitted when a message is dropped
        @signal[messageDropped](type=omnetpp::cPacket);
        //Statistic of the amount of messages that were dropped
        @statistic[msgDropped](title="Messaged dropped"; source=messageDropped; record=count; unit=packets);
        //Statistic of the amount of bytes that were dropped
        @statistic[msgDroppedBytes](title="Dropped Bytes"; source=messageDropped; unit=B; record="sum(packetBytes)","vector(packetBytes)","histogram(packetBytes)?","floatingIntervalSumVector(packetBytes)?"; interpolationmode=none); //possible parameter e.g.: **.floatingintervalvectorrecorder-measure-interval = 20ms for floatingIntervalRecorders
        //End-to-end latency
        @statistic[msgDroppedLatency](title="End-to-end latency"; source="messageAge(messageDropped)"; unit=s; record=stats,histogram?,vector; interpolationmode=none);

        @display("i=block/layer");
        
    gates:
        // input gate for messages from the application
        input applicationIn @directIn;
        // input gate for messages from endpoints
        input endpointIn @directIn;
}
